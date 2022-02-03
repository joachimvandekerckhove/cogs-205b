% This is a pipeline help you automatically download the data file and generate a report of the data.
function main()
	url = "http://cidlab.com/files/cogs205b.csv";
	fname = JieWanHW.getData(url);
	dat = JieWanHW.readData(fname);
	JieWanHW.report(dat);
end