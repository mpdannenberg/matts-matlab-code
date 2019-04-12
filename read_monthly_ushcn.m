function [data,year,dmflag,qcflag,dsflag] = read_monthly_ushcn(fn)
%Read monthly data for USHCN filename ('fn')

fid = fopen(fn);
i = 0;

tline = fgetl(fid);
while ischar(tline)
    
    year(i+1) = str2double(tline(13:16));
    for j=1:12 
        data(i+1,j) = str2double(tline((17:22)+9*(j-1))); 
        dmflag{i+1,j} = tline((23)+9*(j-1));
        qcflag{i+1,j} = tline((24)+9*(j-1));
        dsflag{i+1,j} = tline((25)+9*(j-1));
    end
    
    i = i+1;
    tline = fgetl(fid);
    
end
fclose(fid);
data(data == -9999) = NaN;

end

