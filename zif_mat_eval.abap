INTERFACE zif_mat_eval
  PUBLIC .


  TYPES:
    BEGIN OF ty_result,
      datum TYPE sy-datum,
      menge TYPE menge_d,
      meins TYPE meins,
      dmbtr TYPE dmbtr,
      waers TYPE waers,
    END OF ty_result .
  TYPES:
    tt_result TYPE SORTED TABLE OF ty_result
                       WITH UNIQUE KEY datum .

  METHODS evaluate .
  METHODS get_result
    RETURNING
      VALUE(rt_result) TYPE tt_result .
ENDINTERFACE.
