        dcl-s dsp_text char(3);

        dcl-pi  yes;
         parm_text   char(3) options(*nopass);
        end-pi;

          if %parms > 0;
            dsp_text = parm_text;
          else;
            dsp_text = 'Yes';
          endif;

          dow 1 =1;
            dsply dsp_text;
          enddo;

        *inlr = *on;
