import xarray

def apply_datacube(cube: xarray.DataArray, context: dict) -> xarray.DataArray:
    cube.values = 0.0001 * cube.values
    return cube