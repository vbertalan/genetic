function [cost,par]=ga(fun,di,dom,maxit,popsize,cost,par,const,mutrate,selection)
keep=floor(selection*popsize);
nmut=ceil((popsize-1)*mutrate);
M=fix((popsize-keep)/2);
prob=flipud([1:keep]'/sum([1:keep]));
odds=[0 cumsum(prob(1:keep))'];
iga=0;

while iga<maxit
    iga=iga+1
    pick1=rand(1,M);
    pick2=rand(1,M);
    ic=1;
    while ic<=M
        for id=2:keep+1
            if pick1(ic)<=odds(id) & pick1(ic)>odds(id-1)
                ma(ic)=id-1;
            end
            if pick2(ic)<=odds(id) & pick2(ic)>odds(id-1)
                pa(ic)=id-1;
            end
        end
        ic=ic+1;
    end
    ix=1:2:keep;
    xp=ceil(rand(1,M)*di);
    r=rand(1,M);
    for ic=1:M
        xy=par(ma(ic),xp(ic))-par(pa(ic),xp(ic));
        par(keep+ix(ic),:)=par(ma(ic),:);
        par(keep+ix(ic)+1,:)=par(pa(ic),:);
        par(keep+ix(ic),xp(ic))=par(ma(ic),xp(ic))-r(ic).*xy;
        par(keep+ix(ic)+1,xp(ic))=par(pa(ic),xp(ic))+r(ic).*xy;
        if xp(ic)<di
            temp=par(keep+ix(ic),xp(ic)+1:di);
            par(keep+ix(ic),:)=[par(keep+ix(ic),1:xp(ic)) par(keep+ix(ic)+1,xp(ic)+1:di)];
            par(keep+ix(ic)+1,:)=[par(keep+ix(ic)+1,1:xp(ic)) temp];
        end
    end
    mrow=ceil(rand(1,nmut)*(popsize-const))+const;
    mcol=ceil(rand(1,nmut)*di);
    for ii=1:nmut
        par(mrow(ii),mcol(ii))=(dom(2,mcol(ii))-dom(1,mcol(ii)))*rand+dom(1,mcol(ii));
    end
    cost(const+1:popsize)=feval(fun,par(const+1:popsize,:));
    [cost,ind]=sort(cost);
    par=par(ind,:);
end
