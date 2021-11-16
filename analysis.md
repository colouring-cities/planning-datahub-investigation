# Initial data analysis

### Analysing elements of the `hits` field one by one:

based on [all_in_specific_time_recent.json](all_in_specific_time_recent.json):

- hit #0:
    - site_name, ward, centroid, borough, postcode - address fields
    - street_name - seems to contains something else?
    - uprn - is null...
- hit #1:
    - same properties
...
- hit from Westminster:
    - has a lot more information in `application_details` but it seems mostly statistical/numerical data about the application, not some IDs useful for matching.


However, based on [all_in_specific_time_in_past.json](all_in_specific_time_in_past.json) and [major_only.json](major_only.json):

- some hits have `application_details.existing_uprns` field which presumably contains old property identifiers which would be merged into one by the proposed construction

### Analysing the uprn fields

```
jq '.rawResponse.hits.hits | map(._source) | map(.uprn, .borough)' all_in_specific_time_recent.json
```

This query shows that some boroughs (e.g. Hillingdon) don't have uprns, while others (Westminster, Southwark) do.

### Summary

- records have standard address data (local area, street name and number, etc)
- some boroughs have uprn field and some don't
- some applications list existing uprns affected by the application


### Questions

- which types of `development_type` are we interested in?
- do some boroughs have no uprn field in a consistent manner, or is it dependent on something else e.g. the type of application?
- do the same boroughs have (or don't have) both the `uprn` field and the `application_details.existings_uprns` field, or is it dependent on something else? Basically, does it seem that a borough either has uprn data in their system or not at all?


### Intermediate conclusions

For boroughs that include new uprn and existing uprn data, this could be used for matching with building TOIDs, perhaps with some assistance from the centroid or (published in the future) polygon data. A case study would need to be conducted to see how well the uprns help identify the affected building polygons, and to better understand the relationship between the uprn field and the existing_uprns field.

For boroughs that don't include any uprn IDs, the address data plus the centroids is the last resort, but the difficulty of this task degrades to address matching for listed buildings etc- a lot more work to put in for the matching to work well.