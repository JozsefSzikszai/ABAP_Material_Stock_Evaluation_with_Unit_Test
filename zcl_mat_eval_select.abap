CLASS zcl_mat_eval_select DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE

  GLOBAL FRIENDS zcl_mat_eval_select_factory .

  PUBLIC SECTION.

    INTERFACES zif_mat_eval_select .

    ALIASES get
      FOR zif_mat_eval_select~get .
    ALIASES select
      FOR zif_mat_eval_select~select .
    ALIASES tt_material_movements
      FOR zif_mat_eval_select~tt_material_movements .
    ALIASES ty_material_movement
      FOR zif_mat_eval_select~ty_material_movement .
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA mt_material_movements TYPE tt_material_movements .
    DATA mv_matnr TYPE matnr .

    METHODS constructor
      IMPORTING
        !iv_matnr TYPE matnr .
ENDCLASS.



CLASS ZCL_MAT_EVAL_SELECT IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_MAT_EVAL_SELECT->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_MATNR                       TYPE        MATNR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD constructor.

    mv_matnr = iv_matnr.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_MAT_EVAL_SELECT->ZIF_MAT_EVAL_SELECT~GET
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RT_MATERIAL_MOVEMENTS          TYPE        TT_MATERIAL_MOVEMENTS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD zif_mat_eval_select~get.

    rt_material_movements = mt_material_movements.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_MAT_EVAL_SELECT->ZIF_MAT_EVAL_SELECT~SELECT
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD zif_mat_eval_select~select.

*    SELECT FROM ...

  ENDMETHOD.
ENDCLASS.
