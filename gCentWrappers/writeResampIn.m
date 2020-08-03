function writeResampIn(toResample, gCentFile);

run(gCentFile);

resampDir       = [WORKDIR '/RESAMP'];
datafilename    = [toResample '/filt_topophase.unw.geo'];
losfilename     = [toResample '/los.rdr.geo'];
faultfilename   = [resampDir '/fault.mat'];
demfilename     = [toResample '/dem.crop'];

delete([resampDir '/resamp_in.m']);

load(faultfilename);

zone            = faultstruct.zone;
topsTest        = strfind(toResample,'merged');
tokens          = strsplit(toResample,'/');
if(isempty(topsTest))
    datePair     = tokens{end};
    path         = tokens{end-1};
else
    datePair     = tokens{end-1};
    path         = tokens{end-2};
end

savestructname    = [resampDir '/' datePair '_' path '.mat'];



fid = fopen([resampDir '/resamp_in.m'],'w');

fprintf(fid,'datafilename       = ''%s'';\n', datafilename);
fprintf(fid,'losfilename        = ''%s'';\n', losfilename);
fprintf(fid,'corrfilename       = '''';\n');
fprintf(fid,'demfilename        = ''%s'';\n', demfilename);
fprintf(fid,'faultfilename      = ''%s'';\n', faultfilename);
fprintf(fid,'savestructname     = ''%s'';\n', savestructname);
fprintf(fid,'processor          = ''%s'';\n', 'ISCE');
fprintf(fid,'nx                 = 0;\n');
fprintf(fid,'ny                 = 0;\n');
fprintf(fid,'cropX              = '''';\n');
fprintf(fid,'cropY              = '''';\n');
fprintf(fid,'corThresh          = 0.2;\n');
fprintf(fid,'zone               = ''%s'';\n', zone);
fprintf(fid,'azo                = 0;\n');
fprintf(fid,'const_los          = 0;\n');
fprintf(fid,'limitny            = 0;\n');
fprintf(fid,'minhgt             = 200;\n');
fprintf(fid,'maskdist           = 5e3;\n');
fprintf(fid,'Lp                 = 10;\n');
fprintf(fid,'Wp                 = 10;\n');
fprintf(fid,'maxnp              = 2000;\n');
fprintf(fid,'smoo               = 0.25;\n');
fprintf(fid,'getcov             = 1;\n');
fclose(fid)
