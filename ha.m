function [cost,par]=ha(fun,di,dom,cla,num,r,keep,cr,n_iter,maxit1,mutrate1,maxit2,mutrate2,selection)
%e.g. fun='bump',di=20,dom=[zeros(1,20);10*ones(1,20)],cla=4,num=5
%r=2*[0.5 0.6 0.7 1],keep=8,cr=0.99,n_iter=1000
%optional in ga: maxit1=10,mutrate1=1.0,maxit2=20,mutrate2=0.7,selection=0.5
popsize=num*(cla+num*(power(2,cla)-1));
par=ones(popsize,1)*(dom(2,:)-dom(1,:)).*rand(popsize,di)+ones(popsize,1)*dom(1,:);
cost=feval(fun,par);
if di==2 %draw initiate
    countd=1;
    figure(countd);
    box on
    axis([-100 100 -100 100])
    hold on
    for ii=1:length(cost)
        plot(par(ii,1),par(ii,2),'*')
    end
    hold off
    countd=countd+1;
end %---
[cost,ind]=sort(cost);
minc(1)=cost(1);
meanc(1)=mean(cost);
cost=cost(1:num*cla);
par=par(ind(1:num*cla),:);
iter=1;
[iter cost(1)]
while iter<n_iter
    par2=[];
    cost2=[];
    for ii=1:cla
        ctpar=[];
        ctcost=[];
        tpopsize=num*power(2,ii-1);
        for jj=1:num
            tdom=[par(num*(ii-1)+jj,:)-r(ii)/2*ones(1,di);par(num*(ii-1)+jj,:)+r(ii)/2*ones(1,di)];
            underlimit=tdom(1,:)<dom(1,:);
            tdom(1,:)=tdom(1,:).*not(underlimit)+dom(1,:).*underlimit;
            overlimit=tdom(2,:)>dom(2,:);
            tdom(2,:)=tdom(2,:).*not(overlimit)+dom(2,:).*overlimit;
            tpar=ones(tpopsize,1)*(tdom(2,:)-tdom(1,:)).*rand(tpopsize,di)+ones(tpopsize,1)*tdom(1,:);
            tcost=feval(fun,tpar);
            [tcost,ind]=sort(tcost);
            tpar=tpar(ind,:);
            % embedding GA
            [tcost,tpar]=ga2(fun,di,tdom,maxit1,tpopsize,tcost,tpar,round(tpopsize/2),mutrate1);
            % ---------------------------------------------------
            ctpar=[ctpar;tpar];
            ctcost=[ctcost tcost];
        end
        ctpar=[par(num*(ii-1)+1:num*ii,:);ctpar];
        ctcost=[cost(num*(ii-1)+1:num*ii) ctcost];
        [ctcost,ind]=sort(ctcost);
        ctpar=ctpar(ind,:);
        % embedding GA
        [ctcost,ctpar]=ga(fun,di,dom,maxit2,num*(1+tpopsize),ctcost,ctpar,keep,mutrate2,selection);
        %------------------------------------------------
        if di==2 %draw
            if mod(iter,6)==0
                figure(countd);
                box on
                axis([-100 100 -100 100])
                hold on
                for ii=1:length(ctcost)
                    plot(ctpar(ii,1),ctpar(ii,2),'*')
                end
                hold off
            end
            countd=countd+1;
        end
        iter = iter +1
        minc(iter)=ctcost(1);
        meanc(iter)=mean(ctcost);
        par2=[par2;ctpar(1:keep,:)];
        cost2=[cost2 ctcost(1:keep)];
    end
    [cost2,ind]=sort(cost2);
    cost=cost2(1:num*cla);
    par=par2(ind(1:num*cla),:);
    r(1)=r(1)*cr;
    % r = r*cr
    % iter = iter+1
    % minc(iter)=cost(1);
    % meanc(iter)=mean(cost);
    [iter cost(1)]
end
day=clock;
disp(datestr(datenum(day(1),day(2),day(3),day(4),day(5),day(6)),0))
format short g
disp(['popsize = ' num2str(popsize) ' # dimension = ' num2str(di)])
disp(['#generations = ' num2str(iter) ' best cost = ' num2str(cost(1))])
disp(['best solution'])
disp([num2str(par(1,:))])
disp('ha algorithm')
if di==2 % draw end
    figure(countd);
else
    figure(1)
end
iters=0:length(minc)-1;
plot(iters,minc,'-.',iters,meanc,'-');
xlabel('Generation Number');
ylabel('Fitness');
legend('Best Fitness','Average Fitness',2);
% text(0,minc(1),'Average Fitness');text(0,meanc(1),'Best Fitness')


            

