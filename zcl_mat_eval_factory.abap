CLASS zcl_mat_eval_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS create
      IMPORTING
        !iv_evaluation_type TYPE char4
        !io_mat_eval_select TYPE REF TO zif_mat_eval_select
      RETURNING
        VALUE(ro_mat_eval)  TYPE REF TO zif_mat_eval
      RAISING
        cx_sy_move_cast_error
        cx_sy_create_object_error .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mat_eval_factory IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_MAT_EVAL_FACTORY=>CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_EVALUATION_TYPE             TYPE        CHAR4
* | [--->] IO_MAT_EVAL_SELECT             TYPE REF TO ZIF_MAT_EVAL_SELECT
* | [<-()] RO_MAT_EVAL                    TYPE REF TO ZIF_MAT_EVAL
* | [!CX!] CX_SY_MOVE_CAST_ERROR
* | [!CX!] CX_SY_CREATE_OBJECT_ERROR
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create.

    DATA(lv_classname) = CONV classname( 'ZCL_MAT_EVAL_' && iv_evaluation_type ).
    DATA lo_class TYPE REF TO zif_mat_eval.

    TRY.
        CREATE OBJECT lo_class
               TYPE (lv_classname)
               EXPORTING io_mat_eval_select = io_mat_eval_select.
        ro_mat_eval = CAST zif_mat_eval( lo_class ).
      CATCH cx_sy_move_cast_error.
        RAISE EXCEPTION NEW cx_sy_move_cast_error( ).
      CATCH cx_sy_create_object_error.
        RAISE EXCEPTION NEW cx_sy_create_object_error( ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
