call("java.lang.System.gc");

savepath = getDirectory("Select a target Directory");
print("Chosen Directory: "); print(savepath); print("");
print("Number of open Images: " + nImages);

slide = split(getTitle(), ".");

Dialog.create("Set information");
	Dialog.addMessage("Slide designation:");
		Dialog.addString("SlideNo", slide[0]);
Dialog.show();

slide_no = Dialog.getString();

if (nImages == 0)
	print("No images are open.");
else {
	setBatchMode(true);
	for (i = 1; i <= nImages; i++) {
		selectImage(i);
		run("Image Sequence... ", "format=TIFF name=" + slide_no + "_" + i + "_ start = 0 digits = 4 save = [" + savepath + "0000.tif]");
	}

run("Close All");
call("java.lang.System.gc");
