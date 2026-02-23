CLASS zcl_mat_eval_fifo DEFINITION
  PUBLIC
  INHERITING FROM zcl_mat_eval_template
  FINAL
  CREATE PRIVATE

  GLOBAL FRIENDS zcl_mat_eval_factory .

  PUBLIC SECTION.

    METHODS zif_mat_eval~evaluate
        REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mat_eval_fifo IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_MAT_EVAL_FIFO->ZIF_MAT_EVAL~EVALUATE
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD zif_mat_eval~evaluate.

    LOOP AT mt_material_movements
         ASSIGNING FIELD-SYMBOL(<ls_material_movement>).

      CASE <ls_material_movement>-shkzg.
        WHEN 'S'.
          " if it is a positive stock movement, we just add it to the end
          DATA(ls_result) = CORRESPONDING ty_result( <ls_material_movement> ).
          INSERT ls_result INTO TABLE mt_result.
        WHEN 'H'.
          " if it is a negative stock movement, we subtract it from stock always starting at the first line
          DATA(lv_menge) = <ls_material_movement>-menge.
          WHILE lv_menge GT 0.
            ASSIGN mt_result[ 1 ] TO FIELD-SYMBOL(<ls_result>).
            IF <ls_result> IS ASSIGNED.
              IF <ls_result>-menge GE lv_menge.
                <ls_result>-menge -= lv_menge.
                lv_menge = 0.
              ELSE.
                lv_menge -= <ls_result>-menge.
                DELETE mt_result INDEX 1.
              ENDIF.
              UNASSIGN <ls_result>.
            ENDIF.
          ENDWHILE.
      ENDCASE.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
