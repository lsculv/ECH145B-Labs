#import "template.typ": *

#set math.equation(numbering: "(1)")
#set enum(indent: 20pt)

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "ECH 145B Lab 2 Memo",
)
#line(length: 100%)
*To:* ECH 145B \
*From:* Lucas Culverhouse \
*Date:* May 10, 2023 \
*Subject:* Heat Transfer Through an Aluminum Cylinder \
*CC:* TAs \
*Attachments:* 3
#line(length: 100%)

== Executive Summary 
Using a 6061-T6 aluminum cylinder, several flow conditions were tested to derive heat transfer coefficients. It was found that in general forced convection produced higher heat transfer coeffiecents that natural convection, meaning faster cooliing. The heat transfer coefficients for the most accurate method used were : [number], [number], and [number] for forced convection on high fan speed, forced convection on low fan speed, and natural convection respectivly. Each of the methods used demonstrate different accuarcy when attempting to find the h-value from the data. The most accurate method used was a numerical approach with forward time and centered space; this had a maximum error on the h-value of [number]. The analytical approach also proved to be quite accurate with a maximum h-value error of [number]. This can be attributed to the low Biot number of all the flow conditions, with none having a Biot number larger than 0.005.  


== Theory and Analysis
The geometry of our flow situation drastically simplifies the theoretical approach we must use to understand our system and solve for the h-values. We assume the following conditions are true of our system:
1. Cylindrical geometry $arrow.double$ use radial coordinates, radial symmetry.
2. Insulated top and bottom of cylinder $arrow.double$ 1-D in r coordinate.
3. The ambient temperature outside the cylinder is a constant.
4. At time $t=0s$ the temperatue profile inside the cylinder is uniform at the inital temperature
These assumptions all give us the following governing equation for the temperature in the cylinder:
$
rho C_p (diff T)/(diff t)=k [1/r (diff)/(diff r) (r (diff T)/(diff r))]
$
Where $rho$, $C_p$, and $k$ are the density, heat capactiy and thermal conductivity of the cylinder respectivly. We also know that the total heat transfer at the surface of the cylinder must be zero; that is, any heat that moves to the surface through conduction must be removed thorugh convection at the surface, there will not be any accumulation. This can stated as:
$
q_"conduction"=q_"convection"
$
If we use Newton's law of cooling the represent $q_"convection"$ and (1) to represent $q_"conduction"$ then we can write:
$
m C_p (diff T)/(diff t) bar_(r=R)=-h A_s (T-T_infinity)
$

Equations (1) and (3) form our governing equations for each of the flow situations, where we want to find the heat transfer coefficient $h$ for each flow condition.

There are three approaches that will be used to determine the h-value for each flow situation: analytical, emperical, and numerical.

The analytical approach assumes that the temperature we measure at the center-line of our cylinder is the same thorughout the cylinder, so we can simply integrate (3) to find:
$
(T-T_infinity)/(T_i-T_infinity)=exp(-(t)/(tau))
$ 
Where $tau$ is the dimensionless time constant $tau = (m C_p)/(h A_s)$. This will be used to find the h-value from the temperature data by fitting against the $tau$ parameter to find $h$. We can asses the quality of this assumption using the Biot number which compares conductive heat transfer to convective heat transfer, and is found using the following equation:
$
"Bi"=(h k)/D
$
Where $D$ is the diameter of our cylinder, which is the characteristic length for this geometry.

The emperical approach simply uses known emperical statements of the Nusselt number to find the h-value, where we relate the Nusselt number and the h-value using the following
$
"Nu"=(h D)/k=C "Re"^m "Pr"^(1/3)
$
Where Pr is the Prandtl number, Re is the Reynold's number with $C$ and $m$ being known parameters that vary with the value of the Reynold's number.

Finally we have the numerical approach, where we use a forward time and centered space equation to get both the time dependance of the temperature, but also the radial temperature profile in the cylinder. We will use the following equations to evaluate the temperature:
$
(diff T)/(diff t)=1/(Delta t) (T^(t_"new")-T^t) 
$

$
(diff^2 T)/(diff r^2)=1/(Delta r^2)(T_(r+1)-2T_r+T_(r-1)) 
$

$
(diff T)/(diff r)=1/(2 Delta r) (T_(r+1)-T_(r-1))
$
Where $Delta r$ and $Delta t$ are carefully chosen values for the spacing between radial and time values such that they meet the stability condition $s=alpha (Delta t)/(Delta r^2) < 0.5$, where $alpha$ is the thermal diffusivity of the cylinder. These parameters will be optimized using a brute force search to get the highest resolution numerical solution possible, while still maintaining stability.

Total heat transfer from the cylinder can be obtained using:
$
Q = m C_p Delta T
$

=== Results and Discussion 
Below are the graphs of each of the flow conditions along with the analytical and numerical solutions for each. These show, visually, the correlation between each solution method and the collected data

#let scale = 85%
#align(center,
  grid(
    columns: 2,
    rows: 1,
    gutter: -3em,
    [#image("forced_high.png", width: scale)],
    [#image("forced_low.png", width: scale)],
  )
)

#figure(align(center, image("natural.png", width: scale/1.75)), caption: "Temperature vs time for each of the flow conditions. The 'High' fan speed was 1.1 m/s, the 'Low' fan speed was 0.6 m/s. Each cylinder was insulated on the top and bottom with a piece of thick styrofoam. The temperature readings were taken at the center-line of each cylinder using a thermocouple")

We can see from these graphs that the high fan setting forced convection cooled the fastest of all three, with the natural convection being much slower than the other two, taking about 1.5-2.5 times as long to get close to the ambient temperature. This is consistent with what we would intuitvely expect and what we expect from heat transfer. Higher free stream velocites give thinner boundary layers, meaning higher heat transfer. 

h-values were calculated for each of the flow conditions and each of the methods they are shown here, h has units of $W/(m^2K)$. Also shown are the biot numbers and total heat transfer from each cylinder:

#align(center, table(
  columns: (auto, auto, auto, auto),
  rows: auto,
  [],
  [Forced High],
  [Forced Low],
  [Natural],
  [Analytical],
  [29.71 $plus.minus$ 0.61], [23.60 $plus.minus$ 0.73], [10.97 $plus.minus$ 0.82],
  [Emperical],
  [21.47 $plus.minus$ 0.2], [16.18 $plus.minus$ 0.2], [--],
  [Numerical],
  [29.74 $plus.minus$ 0.15] , [23.58 $plus.minus$ 0.17], [11.01 $plus.minus$ 0.12],
  [Biot Number],
  [0.0044], [0.0035], [0.0016],
  [Total Heat Transfer [J]],
  [2821], [3259], [3176] 
  
  
))

We can see that the emperical solution does a poor job of prediciting the heat transfer coefficients while the analytical and numerical solutions are in close agreement. The error for the analytical and numerical solutions is found using the covariance of the fitting models used for each, while the emperical error is from the error of the velocity measurment taken, where all other values are assumed to be exact. This close agreement can be explained by examining the Biot number for each, here we only use the h values found by the analytical solution to calculate it:

This shows that the effect of convection is 2-3 orders of magnitude larger than the effect of conduction. This allows us to use the lumped capacitance approximation for the analytical solution, without loss of much precision.

We can see from Fig. 1 that using a single h-value for the entire process of heat transfer produces fairly accurate results, however it does seem to become less accurate as the temperature approaches the ambient temperature.

For natural convection, using out analytical model, it would take $2.79 dot 10^5$ s to reach 0.1 $degree C$ of the ambient temperature.
== Conclusions and Recommendations
From the analysis we can see that the more velocity that fluid can be convected past an object with, the faster it will be cooled. This means that for any experiment where rapid cooling is desired, high fan speeds or pump speeds should be preferred. For future experiments, it would be beneficial to have a larger cylinder or other object with a different geometry in order to give a greater weight to the conductive effects. This would raise the Biot number. 

Also, this larger geometry could be used to insert several thermocouples along the cylinder to find if the numerical predications of the temperature profile matched that of the real-world measured data. It would also be intresting to see the effects of a more viscous fluid, like water, and how a natural convection using it would be different. Using a rectangular geometry would also be beneficial to study as it woud provide a different set of governing equations to use.

#pagebreak()

== Appendix

#image("dless.png")