## Get names downtream on your own

# Try to get a Catalogue of Life or ITIS identifier first, using
# - get_col
# - get_tsn

ids1 <- get_col()

ids2 <- get_tsn()

# Then pass on that id to downstream

## Beware that the downstream() call can take a long time
## depending on what you ask for

downstream(tsns=ids1, downto=)

downstream(tsns=ids2, downto=)


# Get all the families downstream from Carnivora


# Get all the families upstream from Pinus contorta

