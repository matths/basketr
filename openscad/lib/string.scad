// string.scad
// string utility functions

// Copyright (c) 2023 Matthias Dittgen (matths) <dittgen@gmail.com>

// This code is under MIT Licence.
// You can find the complete LICENSE file in the root of this project.

function str_to_lower (string) =
  chr([for(s=string) let(c=ord(s)) c<91 && c>64 ?c+32:c]); 

function str_to_upper (string) =
  chr([for(s=string) let(c=ord(s)) c>=97 && c<=122 ? c-32 : c]);

// Compare floats with str precision (same precision as echo())
function str_equal (a, b) =
  str(a) == str(b);
