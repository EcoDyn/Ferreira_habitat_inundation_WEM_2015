# Mamirauá floodplain habitats and inundation duration classes
Classification of floodplain habitats and inundation duration classes produced and published by Ferreira-Ferreira et al.(2015) for the focal area of the Mamirauá Sustainable Development Reserve, in the Central Amazon floodplain, Brazil. Mapping based on multitemporal analysis of ALOS-1/PALSAR-1 Fine Beam synthetic aperture radar data.

### Citation

Ferreira-Ferreira J., Silva T. S. F., Streher A. S., Affonso A. G., Furtado L. F. A., Forsberg B. R., Valsecchi J., Queiroz H. L., Novo E. M. L. M. (2015). Combining ALOS/PALSAR derived vegetation structure and inundation patterns to characterize major vegetation types in the Mamirauá Sustainable Development Reserve, Central Amazon floodplain, Brazil. *Wetlands Ecology and Management*, *23*(1), 41–59. https://doi.org/10.1007/s11273-014-9359-1

### Layers:

**bounding_box**: a simple rectangular bounding box of the mapped area, to facilitate image queries and other functions. It has no attributes.

**mamiraua_basic_habitats**:  layer containing only habitat classes as multi-part polygons. This should be the preferred layer for visualizing habitats only. Fields are:

* `class`: habitat class name, formatted for programmatic use (e.g. `habitat_name`).

* `class_name`: habitat class name, formatted for printing (e.g. *Habitat Name* ).

* `class_code`: numeric integer identifying each habitat class.

* `class_acro`: capitalized two-letter acronym identifying each habitat.

* `area_km2`: total area, in squared kilometers, for each habitat class. Values differ slightly from original publication as these are geodetic (ellipsoid-based) areas instead of planimetric. For original planimetric areas, see the `mamiraua_inundation_habitat` layer.


**mamiraua_inundation_habitat:** layer containing flood duration classes and habitat classes as originally mapped by Ferreira-Ferreira et al. (2015). Polygons correspond to the original segmentation used for classification. Fields are:

* `class`: habitat class name, formatted for programmatic use (e.g. `habitat_name`).
* `class_acro`: capitalized two-letter acronym identifying each habitat.
* `class_name`: habitat class name, formatted for printing (e.g. *Habitat Name* ).
* `class_code`: numeric integer identifying each habitat class.
* `area_km2`: planimetric area, in squared kilometers, for each polygon. For total geodetic (ellipsoid-based) habitat class areas, see the `mamiraua_basic_habitats`layer.
* `fl_stage_m`: minimum stage height, in meters, at which the object is expected to be flooded, based on the 1991–2011 average stage height computed for the Mamirauá Lake Gauge, operated by the Mamirauá Sustainable Development Institute (https://mamiraua.org.br/pt-br/pesquisa-e-monitoramento/monitoramento/fluviometrico/). *Not available* for objects of the "Herbaceous / Soil" and "Water Bodies" classes as they are just directly assigned to a specific inundation class (see Ferreira-Ferreira et al. 2015 for more information). 
* `fl_dur_day`: estimated range of flood duration, in days, based on the 1991-2011 average stage height curve for for the Mamirauá Lake Gauge (see above). Non-floodable (upland) areas have a value of `0`.

### **File formats**

Both layers are available in:

- **ESRI Shapefile format:** separate `*.shp` and associated files, in the `shapefiles`folder. There are also `.qlr`  layer definition files for loading the shapefiles into QGIS with a predefined color scheme matching the published figures.

- **Geopackage file format:**  compressed file named `mamiraua_habitats_inundation_JFF_WEM_2015.zip`, in the`geopackage` folder. 

- All layers are projected in `EPSG:32720` (WGS 84, UTM zone 20S) with the following associated PROJ.4 string: `"+proj=utm +zone=20 +south +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0"`

  

**History of post-publication processing steps:**

- A new habitat layer was produced by dissolving the original objects used as classification inputs, to reduce file size and complexity.
- Areas were recalculated using ellipsoidal geometry for the dissolved layer. 
- Habitat class information was combined with the inundation duration data into a single shapefile, maintaining the original classification objects.  
- Class names were modified to match names used in publication. 
- The simple habitat and habitat + inundation shape files have been converted to geopackage format.
- QGIS palette layers were included for available shapefiles.

