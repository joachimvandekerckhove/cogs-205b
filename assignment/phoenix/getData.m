% Download data from URL
% Input: URL in quotes
% Output: local filename where data is saved

function outfilename = getData(URL)
	filename = "data_cidlab";
	outfilename = websave(filename, URL);
	if isfile("data_cidlab.csv")
                warning("A csv file with that name already exists! It will be overwritten.")
        end

	%fprintf("File downloaded successfully. Saved as : %s.csv\n",filename);
end
