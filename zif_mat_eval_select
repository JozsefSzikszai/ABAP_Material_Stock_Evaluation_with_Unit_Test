INTERFACE zif_mat_eval_select
  PUBLIC .


  TYPES:
    BEGIN OF ty_material_movement,
      datum TYPE sy-datum,
      shkzg TYPE shkzg, " S + ; H -
      menge TYPE menge_d,
      meins TYPE meins,
      dmbtr TYPE dmbtr, " Preis pro Stück
      waers TYPE waers,
    END OF ty_material_movement .
  TYPES:
    tt_material_movements TYPE SORTED TABLE OF ty_material_movement
                                   WITH UNIQUE KEY datum .

  METHODS select .
  METHODS get
    RETURNING
      VALUE(rt_material_movements) TYPE tt_material_movements .
ENDINTERFACE.
