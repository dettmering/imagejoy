call("java.lang.System.gc");

savepath = getDirectory("Select a target Directory");
print("Chosen Directory: "); print(savepath);print("");

//info = "c:1/2; z:1/11; t:1/713 - TileScan_001";
numslice = nSlices;
imageid = getImageID();

//PARSING
function parsename(x) {
	info_parse1 = split(x,";");
	info_parse1_1 = split(info_parse1[0],":");
	info_parse1_1_1 = split(info_parse1_1[1],"/");
	channel = info_parse1_1_1[0];

	info_parse1_2 = split(info_parse1[1],":");
	info_parse1_2_1 = split(info_parse1_2[1],"/");
	focusplane = info_parse1_2_1[0];

	info_parse1_3 = split(info_parse1[2],":");
	info_parse1_3_1 = split(info_parse1_3[1],"/");
	tile = info_parse1_3_1[0];

	final_name = "tilescan"+"_"+tile+"_"+focusplane+"_"+channel+".tif";
	return final_name;
}

setBatchMode(true);
for (i=1; i <= numslice; i++) {
	selectImage(imageid);
	setSlice(i);
	info = getMetadata("label");
	thefilename = parsename(info);
	
	run("Make Substack...", "slices="+i);
	saveAs("Tiff", savepath+thefilename);
	run("Close");
	print(thefilename);
}

call("java.lang.System.gc");
