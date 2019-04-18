function fish_greeting
   if test (random) -ge 10000 > /dev/null
       fortune zippy
   else
       fortune -a
   end
end
