# Implementation

See https://github.com/colouring-cities/colouring-london/pull/898

# The Planning London Datahub
https://www.london.gov.uk/what-we-do/planning/digital-planning/planning-london-datahub

API plans, including explicit mention that it is for a public use: https://smartlondon.medium.com/londons-new-hub-for-planning-data-is-going-live-e33341220ce2

# TODO
- are there API usage limits?
- how to get actual location data? Beyond limited centroid data such as:
    - centroid
    - centroid_easting
    - centroid_northing
- is it possible to get info which specific buildings are to be demolished/rebuilt/renovated/etc?
    - !!!! no?
- is application rejected/approved?
	- `status` field
- has approved work begun?
	- `actual_commencement_date`
- is there an appeal? How many?
	- `appeal_decision_date` field is likely relevant
- is work completed?
	- `actual_completion_date` - empty surprisingly often!
- how multiple repeated applications/appeals/rejections are grouped?

# Contents

- [make_query.py](make_query.py) - generic script fetching specified data
- [all_in_specific_time_in_past.py](all_in_specific_time_in_past.py) - script fetching data - all objects within specific recent timeframe (`decision_date` after 2021-10-21)
- [all_in_specific_time_in_past.json](all_in_specific_time_in_past.json) - data obtained by this script
- [all_in_specific_time_recent.py](all_in_specific_time_recent.py) - script fetching data - all objects within specific timeframe, quite old one (`decision_date` between 2001-10-29 and 2001-11-01)
- [all_in_specific_time_recent.json](all_in_specific_time_recent.json) - data obtained by this script
- [major_only.py](major_only.py) - script fetching data, with additional filtering - `development_type` matches `Major*, and `decision_date` between 2001-10-29 and 2001-12-01
- [major_only.json](major_only.json) - data obtained by this script

It was based on queries made by discover tab at Kibana.
* Looking at network queries made by [that site](https://planningdata.london.gov.uk/dashboard/app/discover#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-1y,to:now)))
* Exporting request as a curl query
* [Transforming it into a Python script](https://reqbin.com/req/python/c-xgafmluu/convert-curl-to-python-requests)
* Removing not needed elements
* Further conversion into working Python script

If this reverse engineering was not needed and there is documentation that was missed - please open an issue.

# See also

* [LIVE STREAMING - planning data streaming tracking ticket](https://github.com/colouring-london/colouring-london/issues/685)
* [discover tab at Kibana](https://planningdata.london.gov.uk/dashboard/app/discover#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-1y,to:now)))
