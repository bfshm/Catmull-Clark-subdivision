[V,F]=obj__read('torus.obj');
V=V';F=F';
obj_display('torus.obj');
for iter = 1:4
    tic;
[VV, FF] = CCSubdivision(V, F, iter);
%[VV, FF] = CCsub(V, F, iter);
obj_write('torus1.obj',VV',FF');
obj_display('torus1.obj');
disp(['��',num2str(iter),'��ϸ������ʱ��Ϊ�� ',num2str(toc)]);
 fprintf('\n');
end