#!/usr/bin/env bash
# Build script for github.com/mubaris/yes
# -------------------------------------
INSTALLED() {
	local loc;
	loc="$(which "$1" 2>&1)"
	if [ $? -eq 0 ] && [ -n "$loc" ]; then
		return 0
	fi

	return 1
}

BUILT() {
	# Force it to be consider built.
	case "$1" in
		"yes"|"YES"|"true"|"TRUE"|1)
			BUILD_LASTEXIT=0
			BUILD_COMPLETE=true
			BUILD_EXECUTED=true
			return 0
			;;
	esac

	# Check if it's built.
	if [ "${BUILD_COMPLETE}" = "true" ]; then
		return 0
	fi

	if [ "${BUILD_LASTEXIT}" = "FAIL" ]; then
		return 0
	fi

	return 1
}

BUILD-FIND() {
	for program in "$@"; do
		if INSTALLED "$program"; then
			printf "%s" "$program"
			return 0
		fi
	done

	return 1
}

BUILD-START() {
	BUILD_LASTERROR=""
	BUILD_LASTEXIT=""
	BUILD_EXECUTED=false
	SRC_FILENAME="$2"
	OUT_FILENAME="$(sed 's/\./-/' <<< "$(basename "$2")")"
	SRC_FILE="${SRC}/${SRC_FILENAME}"
	OUT_FILE="${BIN}/${OUT_FILENAME}"
	printf "\033[33mBuilding \033[0m%-16s\033[3m... " "$1"
}

BUILD-RUN() {
	local first=true
	for arg in "$@"; do
		if "$first"; then
			first=false
			printf "\n\033[36m%s\033[0m" "$arg"
		else
			printf " %s" "$arg"
		fi
	done

	BUILD_EXECUTED=true
	BUILD_LASTERROR="$($@ 2>&1)"
	BUILD_LASTEXIT=$?

	printf "\033[2K\033[A\033[G\033[29C"

	return $ret
}

BUILD-END() {
	# Fail command.
	if [ "${BUILD_LASTEXIT}" = "FAIL" ]; then
		return 0;
	fi

	# Nothing executed.
	if ! [ "${BUILD_EXECUTED}" = "true" ]; then
		printf "\033[31mNo compiler.\033[0m\n"
		return 0
	fi

	# Success/error.
	if [ "${BUILD_LASTEXIT}" -eq 0 ]; then
		printf "\033[32mSuccess.\033[0m\n"
	else
		printf "\033[31mFailure.\033[0m\n"
		if "$OPT_SHOW_ERROR"; then
			printf "%s\033[0m\n" "${BUILD_LASTERROR}"
		fi
	fi
}

BUILD-FAIL() {
	printf "\033[31m%s\033[0m\n" "$1"
	BUILD_LASTEXIT="FAIL"
}

INTERPRETED-COPY() {
	if "${OPT_FORCE_WRAP}"; then
		return 1
	fi

	if [ "$(head -c2 < "${SRC_FILE}")" = "#!" ]; then
		cp "${SRC_FILE}" "${OUT_FILE}"
		chmod +x "${OUT_FILE}"
		return 0
	fi

	return 1
}

INTERPRETED-WRAP() {
	printf "#!/usr/bin/env bash\n"
	local first=true
	for arg in "$@"; do
		if "$first"; then
			first=false
			printf "%q" "$arg"
		else
			case "$arg" in
				'{$@}')
					printf ' $@'
					;;

				*)
					printf " %q" "$arg"
					;;
			esac
		fi
	done
	printf "\nexit $?\n"
}

# -------------------------------------
# Preparation
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN="${DIR}/bin"
OBJ="${DIR}/obj"
SRC="${DIR}"

OPT_SHOW_ERROR=false
OPT_FORCE_WRAP=false
for arg in "$@"; do
	case "$arg" in
		-E|--show-errors)
			OPT_SHOW_ERROR=true
			;;

		-W|--force-wrap)
			OPT_FORCE_WRAP=true
			;;
	esac
done

mkdir -p "${BIN}" &>/dev/null
mkdir -p "${OBJ}" &>/dev/null

# -------------------------------------
# AppleScript
BUILD-START "AppleScript" "yes.applescript"
	case "$(BUILD-FIND osascript)" in
		osascript)
			if INTERPRETED-COPY; then
				BUILT TRUE
			else
				INTERPRETED-WRAP osascript "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				chmod +x "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Awk
BUILD-START "Awk" "yes.awk"
	case "$(BUILD-FIND awk)" in
		awk)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP awk "${OBJ}/${SRC_FILENAME}" -- '{$@}' > "${OUT_FILE}"
				chmod +x "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Brainfuck
BUILD-START "Brainfuck" "yes.bf"
	case "$(BUILD-FIND brainfuck)" in
		brainfuck)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP brainfuck "${OBJ}/${SRC_FILENAME}" > "${OUT_FILE}"
				chmod +x "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Brainfuck (Custom)
BUILD-START "Brainfuck (Args)" "yes.custom.bf"
	case "$(BUILD-FIND brainfuck)" in
		brainfuck)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP brainfuck "${OBJ}/${SRC_FILENAME}" > "${OUT_FILE}"
				chmod +x "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# C
BUILD-START "C" "yes.c"
	case "$(BUILD-FIND clang gcc)" in
		clang)
			BUILD-RUN clang -O3 -o "${OUT_FILE}" "${SRC_FILE}"
			;;

		gcc)
			BUILD-RUN gcc -O3 -o "${OUT_FILE}" "${SRC_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# C++
BUILD-START "C++" "yes.cpp"
	case "$(BUILD-FIND clang++ g++)" in
		clang++)
			BUILD-RUN clang++ -O3 -o "${OUT_FILE}" "${SRC_FILE}"
			;;

		g++)
			BUILD-RUN g++ -O3 -o "${OUT_FILE}" "${SRC_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# C#
BUILD-START "C#" "yes.cs"
	case "$(BUILD-FIND mcs)" in
		mcs)
			BUILD-RUN mcs -optimize+ -out:"${OBJ}/${OUT_FILENAME}.exe" "${SRC_FILE}"
			INTERPRETED-WRAP mono "${OBJ}/${OUT_FILENAME}.exe" '{$@}' > "${OUT_FILE}"
			chmod +x "${OUT_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# D
BUILD-START "D" "yes.d"
	case "$(BUILD-FIND rdmd)" in
		rdmd)
			rdmd --build-only -of"${BIN}/yes-d" yes.d
			BUILT true
			;;
	esac
BUILD-END

# -------------------------------------
# Erlang
BUILD-START "Erlang" "yes.escript"
	BUILD-FAIL "TODO BUILD SCRIPT"
BUILD-END

# -------------------------------------
# Fish
BUILD-START "Fish" "yes.fish"
	case "$(BUILD-FIND fish)" in
		fish)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP fish "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Go
BUILD-START "Go" "yes.go"
	case "$(BUILD-FIND go)" in
		go)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP go run "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Haskell
BUILD-START "Haskell" "yes.hs"
	case "$(BUILD-FIND ghc)" in
		ghc)
			BUILD-RUN ghc "-outputdir ${OBJ} -dynamic -o ${OUT_FILE} ${SRC_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# IL
BUILD-START "IL" "yes.il"
	case "$(BUILD-FIND ilasm)" in
		ilasm)
			BUILD-RUN ilasm /out:"${OBJ}/${OUT_FILENAME}.exe" "${SRC_FILE}"
			INTERPRETED-WRAP mono "${OBJ}/${OUT_FILENAME}.exe" '{$@}' > "${OUT_FILE}"
			chmod +x "${OUT_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# Java
BUILD-START "Java" "yes.java"
	case "$(BUILD-FIND javac)" in
		javac)
			BUILD-RUN javac -d "${OBJ}" "${SRC_FILE}"
			INTERPRETED-WRAP java -cp "${OBJ}" "Yes" '{$@}' > "${OUT_FILE}"
			chmod +x "${OUT_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# Groovy
BUILD-START "Groovy" "yes.groovy"
	case "$(BUILD-FIND groovy)" in
		groovy)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP groovy "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# JavaScript
BUILD-START "JavaScript" "yes.js"
	case "$(BUILD-FIND node)" in
		node)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP node "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Lisp
BUILD-START "Lisp" "yes.lisp"
	BUILD-FAIL "TODO BUILD SCRIPT"
BUILD-END

# -------------------------------------
# Lua
BUILD-START "Lua" "yes.lua"
	BUILD-FAIL "TODO BUILD SCRIPT"
BUILD-END

# -------------------------------------
# Objective-C
BUILD-START "Objective-C" "yes.m"
	case "$(BUILD-FIND clang)" in
		clang)
			BUILD-RUN clang -O3 -framework Foundation -o "${OUT_FILE}" "${SRC_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# OCaml
BUILD-START "OCaml" "yes.ml"
	case "$(BUILD-FIND ocaml)" in
		ocaml)
			BASE_FILENAME="${SRC_FILENAME%%.*}"
			BUILD-RUN ocamlopt -o "${OUT_FILE}" "${SRC_FILE}"
			mv ${BASE_FILENAME}.cmi ${BASE_FILENAME}.cmx ${BASE_FILENAME}.o ${OBJ}
			;;
	esac
BUILD-END

# -------------------------------------
# PHP
BUILD-START "PHP" "yes.php"
	case "$(BUILD-FIND php)" in
		php)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP php "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Perl
BUILD-START "Perl" "yes.pl"
	case "$(BUILD-FIND perl)" in
		perl)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP perl "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Python
BUILD-START "Python" "yes.py"
	case "$(BUILD-FIND python)" in
		python)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP python "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Ruby
BUILD-START "Ruby" "yes.rb"
	case "$(BUILD-FIND ruby)" in
		ruby)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP ruby "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Rust
BUILD-START "Rust" "yes.rs"
	case "$(BUILD-FIND rustc)" in
		rustc)
			BUILD-RUN rustc -o "${OUT_FILE}" "${SRC_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# Scala
BUILD-START "Scala" "yes.scala"
	BUILD-FAIL "TODO BUILD SCRIPT"
BUILD-END

# -------------------------------------
# Shell
BUILD-START "Shell" "yes.sh"
	case "$(BUILD-FIND sh)" in
		sh)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP sh "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Swift
BUILD-START "Swift" "yes.swift"
	case "$(BUILD-FIND swift)" in
		swift)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP swift "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END

# -------------------------------------
# Vala
BUILD-START "Vala" "yes.vala"
	case "$(BUILD-FIND valac)" in
		valac)
			BUILD-RUN valac -o "${OUT_FILE}" "${SRC_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# VB
BUILD-START "VB" "yes.vb"
	case "$(BUILD-FIND vbnc)" in
		vbnc)
			BUILD-RUN vbnc -optimize+ -out:"${OBJ}/${OUT_FILENAME}.exe" "${SRC_FILE}"
			INTERPRETED-WRAP mono "${OBJ}/${OUT_FILENAME}.exe" '{$@}' > "${OUT_FILE}"
			chmod +x "${OUT_FILE}"
			;;
	esac
BUILD-END

# -------------------------------------
# Guile
BUILD-START "Guile" "yes.guile"
	case "$(BUILD-FIND guile)" in
		guile)
			if INTERPRETED-COPY; then
				BUILT true
			else
				INTERPRETED-WRAP sh "${OBJ}/${SRC_FILENAME}" '{$@}' > "${OUT_FILE}"
				cp "${SRC_FILE}" "${OBJ}/${SRC_FILENAME}"
				chmod +x "${OUT_FILE}"
				BUILT TRUE
			fi
			;;
	esac
BUILD-END
