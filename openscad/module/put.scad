module put(x = 0, y = 0, z = 0, c = "gray") {
  color(c)
  translate([x, y, z]) 
  children();
}