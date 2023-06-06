#import "report.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Controlled Release Design and Tartrazine Diffusivity Analysis",
  authors: (
    (name: "Lucas Culverhouse", affiliation: "ECH 145B | Dr. Jiandi Wan\nMay 10, 2023\nSection A02\nLienna Chan | Valdemar Roman | Irving Rosales Gonzalez
"),
  ),
  date: "June 5, 2023",
  abstract: [
In this report we investigate the effects of cross-linking and bead diameter on release kinetics for alignate particles. We discuss a manufacturing methodology for varying the desgin of an alginate release system. We conclude ACME should consider producing alginate beads with a diameter of 2.632 mm in order to achieve their design targets.
],
)

= Introduction
Polymer devices are increasingly important for biomedical applications in drug delivery.
Polymers present many benefits such as biocompatability, ease of production and controllable release characteristics.
These devices allow for less invasive drug delivery systems that can be tightly contolled based on the drug and dose needed.
This presents uses for drugs where toxicity and effectiveness need to be tightly controlled.


To understand the design requirements for these polymer devices, first we have to understand the mass transport principles behind the diffusion from polymers.
Diffusion models from polymers are the subject of considerable research and and modeling.
Ritger and Peppas ,1987 @Ritger_Peppas_1987 establish theoretical models for the diffusion mechanisms from such polymer systems. These rely on the classical models of Fickain diffusion, device geometry, and diffusive properties.
The usefulness of alginate as a biomedial polymer for drug delivery is expolored in a review by Lee and Mooney @Lee_Mooney_2012, where its favorable biomedical and manufacturing properties are explored.
Alginate is cheap, being derived from brown seaweed, making it ideal for use in high volume drug production @Lee_Mooney_2012.
To understand release kinetics, tartrazine is chosen as a common, non-toxic food dye that has similar release kinetics to the desired ACME compound #cite("Handout", "Tartrazine").

This report outlines a experimental process and parameters to meet the design goals of ACME's drug release system, that is a one hour sustained release at $0.010 plus.minus 0.002 "min"^(-1)$.
Here we propose an ideal spherical alginate bead radius for meeting this design goal, along with several suggestions for general polymer based relase design. 

= Theory
#set math.equation(numbering: "(1)")

== Theoretical Fickain Diffusion
To understand the reaction release rates from a polymer we can use the following exponential relation, regardless of the limiting mechanism and device geometry @Ritger_Peppas_1987:

$ M_t/M_infinity = F = k t^n $ <F>

Where $M_t$ is the mass released at a specific time, and $M_infinity$ is the mass released after infinite time; this means $F$ is the mass fraction of the relevant species released.
The exponent $n$ describes the rate controlling mechanism for the device and $k$ is a constant that indicated the characteristic diffusive length and diffusion coefficient @Handout.
@F can be differentiated to get the rate of release for the polymer device:

$ (dif F)/(dif t) = k n t^(n-1) $ <dF>

We can find $k$ for a spherical geometry using the following equation:
$ k = 6 sqrt(D/(pi r^2)) $

We can use the following table to provide theoretical estimations of the release rates:

#figure(caption: [Summary of n-values for different geometries and rate control mechanisms @Handout] ,align(center, table(
  columns: (auto, auto, auto), 
  rows: auto,
  [Control Mechanism], [Slab (n)], [Sphere (n)],
  [Fickian Diffusion], [0.5], [0.43],
  [Polymer Relaxation], [1.0], [0.85],
  [Both Contribute], [0.5 < n < 1.0], [0.43 < n < 0.85],
)))

== Experimental Fickain Diffusion
In order to get an experimental measure of the release rate of designed alginate beads we can derive the following from @F:

$ ln(M_t/M_infinity) = n ln(t) + ln(k) $

This allows us to get the rate of release from our experimental data by using a linear fit on a log-log plot.
As we cannot easialy directly measure the mass released from our beads, we must use the definition of concentration to find the mass released from the beads: 

$ M_t = V C $

To get the concentration we will use a spectrometer to correlate the absorbance of the solution collected at a given time with a concentration using the following relation:

$ C prop "Abs"/"const." $

Where $C$ is the concentration and we relate it with a constant obtained as the slope from plotting known concentrations versus maximum measured absorbance.
These various known concentrations are obtained by a serial dilution of a solution of known concentration.

#set math.equation(numbering: none)
= Experimental Methods 
== Preparation of Alginate Solution
Tartazine powder was dissolved in DI water to make 10 mL of tartrazine solution, and 0.1 g of alginate power was then added.
This solution was mixed using a magnetic stir bar for appoximately 45 minutes until all of the powder was dissolved.
This solution was then stored for later use in a sealed container covered with aluminum foil in a dark dry area.
== Preparation of Tartrazine Alginate Beads
A beaker of around 50 mL of calcium chloride was prepared.
Then the previously prepared alginate solution was loaded into a syringe with the desired tip size, making note of the total amount of solutiion to be dispensed.
Then over approximately 20 seconds multiple alginate drops were dispensed into the calcium chloride solution.
These were then left in the solution for 80 seconds, until they were transfered to a buchner funnel to be dryed by vaccum filtration.

#let scale = 30%
#figure(caption: [Experimental Set up for Alginate Bead Preparation] ,align(center, image("tart.png", height: scale)))

Beads were then quickly collected using a spatula and measured with calipers; after which they were transferred to 100 mL of DI water containting a magnetic stir bar at 200 rpm.
== Spectroscopic Measurment of Tartrazine Concentrations
First, an _Ocean FX_ spectrometer was initially calibrated using a sample of DI water to account for the absorbance of the water solvent in the tartrazine solution; additionally the background or 'dark' interference was calibrated for.
#figure(caption: [Experimental Set up for Spectroscopic Measurment @Handout] ,align(center, image("spectro.png", height: scale)))

Once the calibration was completed and the alginate beads were prepared, a beaker containing 100 mL of DI water was placed on a hot plate with magnetic stir bar, with no heating and stirring set to 200 rpm.
Beads were then placed into the beaker and timing was started. Approximatley every 5 minutes, a cuvette was rinsed with the solution and then filled.
This was then placed into the spectrometer to measure the maximum absorbance.
Quickly after this measurment was completed, and the data recorded, the solution in the cuvette was emptied back into the container to keep the volume of liquid constant.

After approximately 45 minutes of continued measurements, the experiment was stopped. This process was completed multiple times for different bead parameters.



= Results 
== Spectrometer Calibration
The specrometer calibration produced the following relationship between absorbance and concentration, which was used for all later experimental conversions between measured absorbance and concentration.

#figure(image("calib.png"), caption: [Proportionallity between maximum measured absorbance and tartrazine concentration. Serial dilution from a stock solution of $0.5 "mg"/"mL"$ was performed to obatian all concentrations.])

== Tartrazine Release Rate
Below is a table showing the experimental and theoretical $k$ and $n$ values for the selected trial.
#figure(caption: [Calculated k and n values from experimental and Theoretical Methods] ,align(center, table(
  columns: (auto, auto, auto), 
  rows: auto,
  [Method], [k], [n],
  [Theotetical], [0.0569], [0.43],
  [Experimental], [$4.36 dot 10^(-5)$], [0.596],
)))

We can see the mass fraction $M_t/M_infinity$ released over time for several trials below.

#figure(caption: [The mass fraction released by the alginate beads over time. Several different bead diameters were tested to derive the best overall parameters for bead production], align(center, image("frac_time.png")))

We can also see the fitting for the experimental parameters found for k and n

#figure(caption: [log-log fit for the parameters of various beads tested], align(center, image("fit_mass_time.png")))

The final selected trial for the design challenge is show below, generated using the theroetical k and n values derived and show above in Table 2:

#figure(caption: [Release rate over 1 hour from theoretically derived k and n values.], align(center, image("rate_time_final.png")))



= Discussion 
We can see that there is a wide variation in the obtained values for the experimentally fitted data and for the theoretically obtained values. As the theory is quite well established @Ritger_Peppas_1987 there seems to be a source of error polluting the data. This can be seen when insepecting the raw data as a lack of precsion in the collected absorbance values. The software provided for the _Ocean FX_ spectrometer exports data with some preset level of precision. This value is not immediatley apparent when looking at the view it provides, but only after the fact when analyzing the data. This leads to large, stair-stepping effects in the data and makes it unreliable for analysis.

We can see, however that with a bead diameter of 2.632 mm, assuming the release rate is controlled by Fickian diffusion that our long term release rate gets close to the ACME target over 1 hour.

The trend in the release rates is also odd, as from the theory we would expect the release rate to decrease as beads got bigger, whereas we obsever the opposite trend. This may be beacuase of two factors:
+ Imprecision in the measurement of radius. Calipers produce some systematic error from the non rigid beads
+ Not exactness of the cross-linking time effects

= Conclusions 
More testing would have to be done to analyze the optimal parameters for ACME's drug release system. Understanding the magnitude of the effects of both cross-linking and bead size would take more trails to be certain of the overall effects.
However we can conclude that the experimental data must be well collected to obtain useful results, as the collection methods are very sensistive to this parameter.

Alginate beads are relativly easy to produce and can be synthesiszed rapidly, ensuring an easy to manufacture final product. These seem like a great candidate for the final version of this ACME product.

From this report we would conclude a bead diameter of 2.632 mm is desireable for ACME to meet its design target.

#pagebreak()
= Nomenclature
C: Concentration $["mg"/"mL"]$

n: Exponential constant in release rate equation

k: Diffusion constant in release rate equation

$M_t$: Mass released at specific time

$M_infinity$: Mass released at infinite time

F, $M_t/M_infinity$: Mass fraction of species released
#pagebreak()
#bibliography("lab3_works.bib")

#pagebreak()

