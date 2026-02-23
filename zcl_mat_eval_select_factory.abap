CLASS zcl_mat_eval_select_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS create
      IMPORTING
        !iv_matnr                 TYPE matnr
      RETURNING
        VALUE(ro_mat_eval_select) TYPE REF TO zif_mat_eval_select
      RAISING
        cx_sy_move_cast_error .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MAT_EVAL_SELECT_FACTORY IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_MAT_EVAL_SELECT_FACTORY=>CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_MATNR                       TYPE        MATNR
* | [<-()] RO_MAT_EVAL_SELECT             TYPE REF TO ZIF_MAT_EVAL_SELECT
* | [!CX!] CX_SY_MOVE_CAST_ERROR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create.

    TRY.
        ro_mat_eval_select = CAST zif_mat_eval_select( NEW zcl_mat_eval_select( iv_matnr ) ).
      CATCH cx_sy_move_cast_error.
        RAISE EXCEPTION NEW cx_sy_move_cast_error( ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
