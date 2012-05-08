call("java.lang.System.gc");

savepath = getDirectory("Select a target Directory");
print("Chosen Directory: "); print(savepath);print("");
print("Number of open Images: "+nImages);

Dialog.create("Set information");
	Dialog.addMessage("Slide designation:");
		Dialog.addString("SlideNo", "1");
Dialog.show();

slide_no = Dialog.getString();
prefix= "DAPI_";
suffix = ".tif";

if (nImages==0)
	print("No images are open.");
else {
	setBatchMode(true);
	for (i=1; i<=nImages; i++) {
		selectImage(i);
		run("Delete Slice");
		run("Delete Slice");
		run("Delete Slice");
		save(savepath+slide_no+"_"+prefix+i+suffix);
		print("Image saved as: "); print(savepath+slide_no+"_"+prefix+i+suffix);
	}
run("Close All");
call("java.lang.System.gc");
