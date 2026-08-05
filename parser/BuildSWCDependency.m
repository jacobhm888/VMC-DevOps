function DependencyTable = BuildSWCDependency(InterfaceTables)

% ==========================================================
% VMC-DevOps
% Build SWC Dependency
% ==========================================================

fprintf("\n==============================\n");
fprintf(" Build SWC Dependency\n");
fprintf("==============================\n");

DependencyTable = table();

Producer = strings(0,1);
Consumer = strings(0,1);
Signal   = strings(0,1);

%% Collect all outputs

OutputTable = table();

for i = 1:length(InterfaceTables)

    T = InterfaceTables{i};

    idx = strcmp(T.Direction,"Output");

    OutputTable = [OutputTable;T(idx,:)];

end

%% Match every input

for i = 1:length(InterfaceTables)

    T = InterfaceTables{i};

    idx = strcmp(T.Direction,"Input");

    Inputs = T(idx,:);

    for j = 1:height(Inputs)

        sig = Inputs.Signal(j);

        k = find(strcmp(OutputTable.Signal,sig));

        if isempty(k)

            continue;

        end

        Producer(end+1)=OutputTable.SWC(k(1));

        Consumer(end+1)=Inputs.SWC(j);

        Signal(end+1)=sig;

    end

end

DependencyTable = table(Producer,...
                        Signal,...
                        Consumer);

disp(DependencyTable);

end
