void main(List<String> arguments) {
  var output = "";
  
  if (arguments.length > 0) {
    for (var args in arguments)
      output += args + ' ';
  }
  else
    output = 'y';
  
  while (true) {
    print('$output');
  }
}
