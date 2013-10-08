call("java.lang.System.gc");

savepath = getDirectory("Select a target Directory");
print("Chosen Directory: "); print(savepath);print("");
print("Number of open Images: "+nImages);

Dialog.create("Set information");
	Dialog.addMessage("Slide designation:");
		Dialog.addString("SlideNo", "1");
Dialog.show();

slide_no = Dialog.getString();
prefix_DAPI= "DAPI_";
prefix_FITC= "FITC_";
prefix_PI= "PI_";
suffix = ".tif";

if (nImages==0)
	print("No images are open.");
else {
	setBatchMode(true);
	for (i=1; i<=nImages; i++) {
		selectImage(i);
		saveAs("Tiff", savepath + slide_no + "_" + i + "_ch1.tif");
	}
run("Close All");
call("java.lang.System.gc");
