root = exports ? this

root.update = (collection, collectionId, propsObject) ->
  collection.update(
    {_id: collectionId},
    {$set: propsObject}
  )