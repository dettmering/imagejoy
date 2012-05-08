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
		run("Image Sequence... ", "format=TIFF name="+slide_no+"_"+i+"_ start=0 digits=4 save=["+savepath+"0000.tif]");
	}
run("Close All");
call("java.lang.System.gc");
