clear all

[vert,face]=obj__read('cube.obj');
vert=vert';face=face';


nvert=max(max(face));
nface=size(face,1);

A=sparse(nvert,nvert);
for i=1:nface
    %if verb
        %progressbar(i,nface);
        
    %end
    f=face(i,:);
    A(f(1),f(2))=A(f(1),f(2))+1;
    A(f(1),f(4))=A(f(1),f(4))+1;
    A(f(3),f(2))=A(f(3),f(2))+1;
    A(f(3),f(4))=A(f(3),f(4))+1;
end
A=A+A';

for i=1:nvert
    u=find(A(i,:)==1);
    if ~isempty(u)
        boundary=[i u(1)];
        break;
    else
        boundary=[];
    end
end

if ~isempty(boundary)
    s=boundary(2);
    i=2;
    while(i<=nvert)
        u=find(A(s,:)==1);
        if length(u)~=2
            warning('problem in boundary');
        end
        if u(1)==boundary(i-1)
            s=u(2);
        else
            s=u(1);
        end
        if s~=boundary(1)
            boundary=[boundary s];
        else
            break;
        end
        i=i+1;
    end
    
    if i>nvert
        warning('problem in boundary');
    end
    
end
