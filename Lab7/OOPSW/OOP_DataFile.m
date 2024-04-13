% Simscape(TM) Multibody(TM) version: 23.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(7).translation = [0.0 0.0 0.0];
smiData.RigidTransform(7).angle = 0.0;
smiData.RigidTransform(7).axis = [0.0 0.0 0.0];
smiData.RigidTransform(7).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 20 0];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(1).ID = "B[Podstawa-1:-:Podstawa-P-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [0 10 0];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(2).axis = [0.57735026918962584 -0.57735026918962573 0.57735026918962573];
smiData.RigidTransform(2).ID = "F[Podstawa-1:-:Podstawa-P-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 57 -6.5000000000000036];  % mm
smiData.RigidTransform(3).angle = 0;  % rad
smiData.RigidTransform(3).axis = [0 0 0];
smiData.RigidTransform(3).ID = "B[Podstawa-P-1:-:P-R-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [2.7859936579943678e-12 -1.5000000000068976 9.1593399531575415e-13];  % mm
smiData.RigidTransform(4).angle = 2.0943951023931935;  % rad
smiData.RigidTransform(4).axis = [-0.57735026918962506 -0.57735026918962729 -0.57735026918962495];
smiData.RigidTransform(4).ID = "F[Podstawa-P-1:-:P-R-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [15.000000000000002 1 -5.0000000000000044];  % mm
smiData.RigidTransform(5).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(5).axis = [0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(5).ID = "B[P-R-1:-:R-Q-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [78.236422781245608 0.99999999999647571 4.9999999999968878];  % mm
smiData.RigidTransform(6).angle = 2.0943951023931944;  % rad
smiData.RigidTransform(6).axis = [-0.57735026918962185 -0.57735026918962584 0.57735026918962962];
smiData.RigidTransform(6).ID = "F[P-R-1:-:R-Q-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 0 0];  % mm
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = "RootGround[Podstawa-1]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(4).mass = 0.0;
smiData.Solid(4).CoM = [0.0 0.0 0.0];
smiData.Solid(4).MoI = [0.0 0.0 0.0];
smiData.Solid(4).PoI = [0.0 0.0 0.0];
smiData.Solid(4).color = [0.0 0.0 0.0];
smiData.Solid(4).opacity = 0.0;
smiData.Solid(4).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.0075385525935129129;  % kg
smiData.Solid(1).CoM = [0 26.477328490983101 0];  % mm
smiData.Solid(1).MoI = [1.6780635652318432 0.20315503151366129 1.6820620112854463];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "Podstawa-P*:*Domyślna";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.0030353981633974478;  % kg
smiData.Solid(2).CoM = [0 7.5874633939897063 0];  % mm
smiData.Solid(2).MoI = [0.13060914958098116 0.094192477042468081 0.13060914958098116];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [1 0.56470588235294117 0.46666666666666667];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "Podstawa*:*Domyślna";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.0073284402528821166;  % kg
smiData.Solid(3).CoM = [44.282001190140576 5.0000000000000018 0];  % mm
smiData.Solid(3).MoI = [0.10933558707680337 5.1452499760347044 5.1261691248547647];  % kg*mm^2
smiData.Solid(3).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(3).color = [0.12156862745098039 0.25098039215686274 1];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "R-Q*:*Domyślna";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.0039824402528821192;  % kg
smiData.Solid(4).CoM = [41.435273229919432 5 0];  % mm
smiData.Solid(4).MoI = [0.12628742041013669 3.0010738124647633 2.9883154612848242];  % kg*mm^2
smiData.Solid(4).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(4).color = [0.40392156862745099 1 0.44705882352941173];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = "P-R*:*Domyślna";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the CylindricalJoint structure array by filling in null values.
smiData.CylindricalJoint(1).Rz.Pos = 0.0;
smiData.CylindricalJoint(1).Pz.Pos = 0.0;
smiData.CylindricalJoint(1).ID = "";

smiData.CylindricalJoint(1).Rz.Pos = -102.07777165376369;  % deg
smiData.CylindricalJoint(1).Pz.Pos = 0;  % mm
smiData.CylindricalJoint(1).ID = "[Podstawa-P-1:-:P-R-1]";


%Initialize the PrismaticJoint structure array by filling in null values.
smiData.PrismaticJoint(1).Pz.Pos = 0.0;
smiData.PrismaticJoint(1).ID = "";

smiData.PrismaticJoint(1).Pz.Pos = 0;  % m
smiData.PrismaticJoint(1).ID = "[P-R-1:-:R-Q-1]";


%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(1).Rz.Pos = 90.0;
smiData.RevoluteJoint(1).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = 79.597612247169423;  % deg
smiData.RevoluteJoint(1).ID = "[Podstawa-1:-:Podstawa-P-1]";

