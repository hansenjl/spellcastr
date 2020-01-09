RESTFul Routing Conventions:

SpellCastr

Model: Spells

Views:

See all instances of a model:
Verb - GET
View - Index
Route - spellcastr.com/spells

See one instance of a model:
Verb - GET
View - Show
Route - spellcastr.com/spells/:id

See the form to create a new instance:
Verb - GET
View - New
Route - spellcastr.com/spells/new

Submit the form to create a new instance:
Verb - POST
Reroute - spellcastr.com/spells/:id
(we reroute to the showpage of the instance we just created )

See the form to edit an instance:
Verb - GET
View - Edit
Route - spellcastr.com/spells/:id/edit

Submit the form to edit an instance
Verb - PUT/PATCH
Reroute - spellcastr.com/spells/:id
(we reroute to the showpage of the instance we just edited)

Delete an instance
Verb - DELETE
Reroute - spellcastr.com/spells (reroute back to the index that shows all instances)
