function TY=KELMdnapl_P5_L2(XX)
%y标准化了精度高，用这个
% figure(1);
% plot(d,'o-');
% % grid on;
% whos d;
load 'Syangben2.txt'

M=Syangben2;


X(1:200,1:32)= M(1:200,17:48);
X(1:200,33)= M(1:200,53);
% X(31:90,1:8)= M(61:120,1:8);
Y(1:200,1) = M(1:200,5);
% Y(31:90,1)= M(61:120,18);
a = XX;
b = 1;
e=[Y,X];
fid = fopen('sinc_train','w');
fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e');
e=e';
f =[b,a];
fid = fopen('sinc_test','w');
fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',f');
f=f';
%%
kernel_pars(1:2)=[9.99871283765772,3.34648380716097];
%train
%[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm('sinc_train', 'sinc_test', 0, 20, 'sig')
%[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm_kernel('sinc_train1', 'sinc_test1', 0, 9000, 'RBF_kernel',2000)
%[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm_kernel('mpg_train', 'mpg_test', 0, 990, 'RBF_kernel',2)
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY] = elm_kernel('sinc_train', 'sinc_test', 0, 8.90867975082039, 'poly_kernel',kernel_pars);
TY=TY';
% fid = fopen('TY1','w');
% fprintf(fid,'%2.8f\n',TY);
% TY2=load('TY1')
% [TrainingTime, TrainingAccuracy]=elm_train('sinc_train', 0, 20, 'sig')
% [TestingTime, TestingAccuracy] = elm_predict('sinc_test')
%TY=[-0.4744	-0.9236	0.5047	0.3408	-0.2459	0.8941	-0.2186	-0.4021	-0.5576	0.9114	-0.1027	-0.9459	-0.7833	-0.8742	0.4307	-0.0056	-0.3316	0.6325	-0.0568	0.5446]
% predict=mapminmax('reverse',TY2',DATA1ps)
% predict=predict';
fclose(fid);
% figure(1)
% hold on;
% plot(predict,'r*-');
% legend('original','predict');
% % title('矿山地质环境评价及预测的SVM网络模型预测结果输出曲线');
% xlabel('Sample points');
% ylabel('Comprehensive index');
% hold off