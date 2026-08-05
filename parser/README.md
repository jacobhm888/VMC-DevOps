BuildSWCDependency运行方式

Interfaces = {};

Interfaces{1}=ParseSWCTopInterface("CIL.slx");

Interfaces{2}=ParseSWCTopInterface("OBS.slx");

Interfaces{3}=ParseSWCTopInterface("VMC.slx");

Dependency = BuildSWCDependency(Interfaces);
