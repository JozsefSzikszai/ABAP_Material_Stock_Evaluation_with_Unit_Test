
CLASS lct_mat_eval_factory DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      f_cut TYPE REF TO zcl_mat_eval_factory.  "class under test
    CLASS-DATA go_mat_eval_select TYPE REF TO zif_mat_eval_select.

    CLASS-METHODS: class_setup.
    CLASS-METHODS: class_teardown.
    METHODS: create_fifo FOR TESTING.
    METHODS: create_lifo FOR TESTING.
    METHODS: create_abcd FOR TESTING. "testing no valid class name
ENDCLASS.       "lct_Mat_Eval_Factory


CLASS lct_mat_eval_factory IMPLEMENTATION.

  METHOD class_setup.

    " We just need a class here for the constructor...
    DATA lv_matnr TYPE matnr.
    go_mat_eval_select = zcl_mat_eval_select_factory=>create( lv_matnr ).

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD create_fifo.

    DATA ro_mat_eval TYPE REF TO zif_mat_eval.

    ro_mat_eval = zcl_mat_eval_factory=>create(
        iv_evaluation_type = 'FIFO'
        io_mat_eval_select = go_mat_eval_select ).

    IF ro_mat_eval IS NOT INSTANCE OF zcl_mat_eval_fifo.
      cl_abap_unit_assert=>fail( ).
    ENDIF.

  ENDMETHOD.

  METHOD create_lifo.

    DATA ro_mat_eval TYPE REF TO zif_mat_eval.

    ro_mat_eval = zcl_mat_eval_factory=>create(
        iv_evaluation_type = 'LIFO'
        io_mat_eval_select = go_mat_eval_select ).

    IF ro_mat_eval IS NOT INSTANCE OF zcl_mat_eval_lifo.
      cl_abap_unit_assert=>fail( ).
    ENDIF.

  ENDMETHOD.

  METHOD create_abcd.

    DATA ro_mat_eval TYPE REF TO zif_mat_eval.

    TRY.
        ro_mat_eval = zcl_mat_eval_factory=>create(
            iv_evaluation_type = 'ABCD'
            io_mat_eval_select = go_mat_eval_select ).

        " Instance would not be valid, so it cannot be created
        cl_abap_unit_assert=>fail( ).

      CATCH cx_sy_move_cast_error.

      CATCH cx_sy_create_object_error.
        " it has to happen, so we are OK here
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
