# Ferreira_habitat_inundation_WEM_2015
Habitat and inundation maps published in Ferreira-Ferreira et al., Wetlands Ecology and Management, 2015.

Layers:

**Mamiraua_basic_habitats**:  layer containing only habitat classes as multipart polygons. Fields are:

* `class_name`: habitat class name, formatted for printing (e.g. *Habitat Name* ).
* `class`: habitat class name, formatted for programmatic use (e.g. `habitat_name`).
* `class_code`: numeric integer identifying each habitat class.
* `class_acro`: capitalized two-letter acronym identifying each habitat.
* `area_km2`: total area, in squared kilometers, for each habitat class. Values differ slightly from original publication as these are geodetic (ellipsoid-based) areas instead of planimetric.









All layers are given in EPSG...



Processing steps after publication:

- A new habitat layer was produced by dissolving the original objects used as classification inputs, to reduce file size and complexity OK.
- Areas were recalculated using ellpsoidal geometry. OK

 Habitat class information was combined with the inundation duration data, maintaining the original classification objects.  

3) Class names were modified to match names used in publication.

4) The habitat + inundation .shp file has been converted to geodatabase format.

5) QGIS palette layers were included for available shapefiles