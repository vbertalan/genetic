function [cost,par]=ga2(fun,di,dom,maxit,popsize,cost,par,const,mutrate)
nmut=ceil((popsize-1)*mutrate);
iga=0;

while iga<maxit
    iga=iga+1
    mrow=ceil(rand(1,nmut)*(popsize));
    mcol=ceil(rand(1,nmut)*di);
    for ii=1:nmut
        if mrow(ii)<=const
            tpar=par(mrow(ii),:);
            tpar(mcol(ii))=(dom(2,mcol(ii))-dom(1,mcol(ii)))*rand+dom(1,mcol(ii));
            tcost=feval(fun,tpar);
            %% VERIFICAR ESTE ITEM AQUI, PODE ESTAR ERRADO
            if tcost<tcost
                cost(mrow(ii))=tcost;
                par(mrow(ii),mcol(ii))=tpar(mcol(ii));
            end
        else
            par(mrow(ii),mcol(ii))=(dom(2,mcol(ii))-dom(1,mcol(ii)))*rand+dom(1,mcol(ii));
        end
    end
    cost(const+1:popsize)=feval(fun,par(const+1:popsize,:));
    [cost,ind]=sort(cost);
    par=par(ind,:);
end
