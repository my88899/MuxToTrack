function r=creat_rMatrix(circle_center,cross_point)
for i=1:3
    t_r=0;
    for j=1:3
        t_r=t_r+(circle_center{i}(j)-cross_point(j))^2;
    end
    r(i)=sqrt(t_r);
end

