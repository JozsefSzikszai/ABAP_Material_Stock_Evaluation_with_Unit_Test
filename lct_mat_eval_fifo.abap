*"* use this source file for your ABAP unit test classes

CLASS lct_mat_eval_select_double DEFINITION FOR TESTING.

  PUBLIC SECTION.
    INTERFACES zif_mat_eval_select PARTIALLY IMPLEMENTED.
    METHODS set IMPORTING it_material_movements TYPE zif_mat_eval_select=>tt_material_movements.

  PRIVATE SECTION.
    DATA mt_material_movements TYPE zif_mat_eval_select=>tt_material_movements.

ENDCLASS.

CLASS lct_mat_eval_select_double IMPLEMENTATION.

  METHOD set.

    mt_material_movements = it_material_movements.

  ENDMETHOD.

  METHOD zif_mat_eval_select~get.

    rt_material_movements = mt_material_movements.

  ENDMETHOD.

ENDCLASS.

CLASS lct_mat_eval_fifo DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-DATA mo_mat_eval_select TYPE REF TO lct_mat_eval_select_double.
    CLASS-METHODS class_setup.

    METHODS: evaluate_1 FOR TESTING.
    METHODS: evaluate_2 FOR TESTING.
    METHODS: evaluate_3 FOR TESTING.
    METHODS: evaluate_4 FOR TESTING.

ENDCLASS.       "lct_Mat_Eval_Fifo


CLASS lct_mat_eval_fifo IMPLEMENTATION.

  METHOD class_setup.

    mo_mat_eval_select = NEW lct_mat_eval_select_double( ).

  ENDMETHOD.

  METHOD evaluate_1.

    DATA(lt_material_movements) = VALUE zif_mat_eval_select=>tt_material_movements(
      ( datum = '20260101' shkzg = 'S' menge = '10' meins = 'ST' dmbtr = '10.00' waers = 'EUR' )
      ( datum = '20260102' shkzg = 'S' menge = '8'  meins = 'ST' dmbtr = '15.00' waers = 'EUR' ) ).
    mo_mat_eval_select->set( lt_material_movements ).

    DATA(lt_expected) = VALUE zif_mat_eval=>tt_result(
      ( datum = '20260101' menge = '10' meins = 'ST' dmbtr = '10.00' waers = 'EUR' )
      ( datum = '20260102' menge = '8'  meins = 'ST' dmbtr = '15.00' waers = 'EUR' ) ).

    TRY.
        DATA(lo_cut) = zcl_mat_eval_factory=>create( iv_evaluation_type = 'FIFO'
                                                     io_mat_eval_select = mo_mat_eval_select ).
        lo_cut->evaluate( ).
        cl_abap_unit_assert=>assert_equals(
          act = lo_cut->get_result( )
          exp = lt_expected ).
      CATCH cx_sy_move_cast_error.
    ENDTRY.

  ENDMETHOD.

  METHOD evaluate_2.

    DATA(lt_material_movements) = VALUE zif_mat_eval_select=>tt_material_movements(
      ( datum = '20260101' shkzg = 'S' menge = '10' meins = 'ST' dmbtr = '10.00' waers = 'EUR' )
      ( datum = '20260102' shkzg = 'S' menge = '8'  meins = 'ST' dmbtr = '15.00' waers = 'EUR' )
      ( datum = '20260103' shkzg = 'H' menge = '5'  meins = 'ST' dmbtr = '0.00'  waers = 'EUR' ) ).
    mo_mat_eval_select->set( lt_material_movements ).

    DATA(lt_expected) = VALUE zif_mat_eval=>tt_result(
      ( datum = '20260101' menge = '5' meins = 'ST' dmbtr = '10.00' waers = 'EUR' )
      ( datum = '20260102' menge = '8' meins = 'ST' dmbtr = '15.00' waers = 'EUR' ) ).

    TRY.
        DATA(lo_cut) = zcl_mat_eval_factory=>create( iv_evaluation_type = 'FIFO'
                                                     io_mat_eval_select = mo_mat_eval_select ).
        lo_cut->evaluate( ).
        cl_abap_unit_assert=>assert_equals(
          act = lo_cut->get_result( )
          exp = lt_expected ).
      CATCH cx_sy_move_cast_error.
    ENDTRY.

  ENDMETHOD.

  METHOD evaluate_3.

    DATA(lt_material_movements) = VALUE zif_mat_eval_select=>tt_material_movements(
      ( datum = '20260101' shkzg = 'S' menge = '10' meins = 'ST' dmbtr = '10.00' waers = 'EUR' )
      ( datum = '20260102' shkzg = 'S' menge = '8'  meins = 'ST' dmbtr = '15.00' waers = 'EUR' )
      ( datum = '20260103' shkzg = 'H' menge = '15' meins = 'ST' dmbtr = '0.00'  waers = 'EUR' ) ).
    mo_mat_eval_select->set( lt_material_movements ).

    DATA(lt_expected) = VALUE zif_mat_eval=>tt_result(
      ( datum = '20260102' menge = '3' meins = 'ST' dmbtr = '15.00' waers = 'EUR' ) ).

    TRY.
        DATA(lo_cut) = zcl_mat_eval_factory=>create( iv_evaluation_type = 'FIFO'
                                                     io_mat_eval_select = mo_mat_eval_select ).
        lo_cut->evaluate( ).
        cl_abap_unit_assert=>assert_equals(
          act = lo_cut->get_result( )
          exp = lt_expected ).
      CATCH cx_sy_move_cast_error.
    ENDTRY.

  ENDMETHOD.

  METHOD evaluate_4.

    DATA(lt_material_movements) = VALUE zif_mat_eval_select=>tt_material_movements(
      ( datum = '20260101' shkzg = 'S' menge = '10' meins = 'ST' dmbtr = '10.00' waers = 'EUR' )
      ( datum = '20260102' shkzg = 'H' menge = '5'  meins = 'ST' dmbtr = '0.00'  waers = 'EUR' )
      ( datum = '20260103' shkzg = 'S' menge = '8'  meins = 'ST' dmbtr = '15.00' waers = 'EUR' )
      ( datum = '20260104' shkzg = 'H' menge = '8'  meins = 'ST' dmbtr = '0.00'  waers = 'EUR' ) ).
    mo_mat_eval_select->set( lt_material_movements ).

    DATA(lt_expected) = VALUE zif_mat_eval=>tt_result(
      ( datum = '20260103' menge = '5' meins = 'ST' dmbtr = '15.00' waers = 'EUR' ) ).

    TRY.
        DATA(lo_cut) = zcl_mat_eval_factory=>create( iv_evaluation_type = 'FIFO'
                                                     io_mat_eval_select = mo_mat_eval_select ).
        lo_cut->evaluate( ).
        cl_abap_unit_assert=>assert_equals(
          act = lo_cut->get_result( )
          exp = lt_expected ).
      CATCH cx_sy_move_cast_error.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
