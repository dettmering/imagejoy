run("Specify...", "width=735 height=571 x=508 y=448 centered");
run("Crop");
run("Duplicate...", "title=[2011-09-09 4113 FSP1-568 ED1-488.030.A-1.JPG]");
run("Split Channels");
selectWindow("2011-09-09 4113 FSP1-568 ED1-488.030.A-1.JPG (blue)");
run("Images to Stack", "name=Stack title=[] use");
run("Reverse");
run("Make Montage...", "columns=2 rows=2 scale=1 first=1 last=4 increment=1 border=2 font=12");
