CLASS zcl_mat_eval_template DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_mat_eval .

    ALIASES evaluate
      FOR zif_mat_eval~evaluate .
    ALIASES get_result
      FOR zif_mat_eval~get_result .
    ALIASES tt_result
      FOR zif_mat_eval~tt_result .
    ALIASES ty_result
      FOR zif_mat_eval~ty_result .

    METHODS constructor
      IMPORTING
        !io_mat_eval_select TYPE REF TO zif_mat_eval_select .
  PROTECTED SECTION.

    DATA mt_result TYPE tt_result .
    DATA mt_material_movements TYPE zif_mat_eval_select=>tt_material_movements .
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mat_eval_template IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_MAT_EVAL_TEMPLATE->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_MAT_EVAL_SELECT             TYPE REF TO ZIF_MAT_EVAL_SELECT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD constructor.

    mt_material_movements = io_mat_eval_select->get( ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_MAT_EVAL_TEMPLATE->ZIF_MAT_EVAL~EVALUATE
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD zif_mat_eval~evaluate.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_MAT_EVAL_TEMPLATE->ZIF_MAT_EVAL~GET_RESULT
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RT_RESULT                      TYPE        TT_RESULT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD zif_mat_eval~get_result.

    rt_result = mt_result.

  ENDMETHOD.
ENDCLASS.
