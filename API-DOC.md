# Available Shifts API

## Description

Returns shifts in the system that currently have available shift openings and could potentially be requested by an appropriately credentialed provider.

Returned shifts meet the following criteria

* The shifts are at facilities located within `radius` miles of the provided `address` query param.
* If `address` is not provided, the `within_distance` is not taken into account and is returned as `null`.
* Shift start times fall in the time interval defined by the `start` and `type` query params.
* Shifts have a start date after NOW minus 3 hours.

## Notes

If an address is provided via the `address` query param and the address cannot be geo-coded, then a `422` will be returned.

The returns `within_distance` in the respone for each facility will always be a multiple of 10 starting at 10. For example, if the facility distance is 14.5 miles away from the lat/lng used in the search, `within_distance` will be 20.

## Request
`GET https://staging-app.shiftkey.com/api/v2/available_shifts`

## Headers
```
"Content-Type: application/json"
"Accept: application/json"
```

## Query Parameters


| Parameter | Status   | Description                                                                                                                                                                                                                                                                                                |
|-----------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|type       |optional  |Response type. Possible values: **week, 4day and list**.|
|start      |optional  |Start date/datetime. Possible formats: **YYYY-MM-DD** and ISO 8601 date time.
|end        |optional  |End date/datetime. Possible formats: **YYYY-MM-DD** and ISO 8601 date time. Only applicable when type query param is list.
|address	|**required**|Address to serve as the search location. Disregarded if lat and lng are provided. A 422 is returned if the address cannot be geo-coded.
|radius     |optional  |Distance from lat/lng or address to be used in the shift search. Defaults to 150. Distance is in miles.
