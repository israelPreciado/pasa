<!--#include file="funcion3/funcion.inc"-->
<% 
            cr = request("cr")
            id_zona=request("select_zona")
            id_territorio=request("select_territorial")
            nombre_lobby=request("nombre")
            num_atms=request("select_numeroAtms")
            fecha_autorizacion_voboCanales=request("corte")
            estatus_arrendamiento=request("arrendamiento")
            fecha_entrega_local_arrendamiento=request("corte2")
            fecha_entrega_anteproyecto=request("corte5")
            vobo_canales_anteproyecto=request("corte3")
            estatus_ingenieria=request("ingenieria")
            fecha_entrega_ingenieria=request("corte4")
            concurso_asignacion_proveedor=request("select_tipoProveedor")
            id_proveedor=request("select_contratistas")
            id_supervisor=request("select_supervisores")
            estatus_permisos=request("estatus_permiso")
            fecha_entrega_comercial=request("corte8")
            estatus_produccion=request("select_estatusProduccion")
            fecha_inicio_obra=request("corte6")
            inicio_reprogramado=request("corte7")
             fin_reprogramado=request("corte10")
            id_lobby=request("id_lobby")



   set conexion2 = Server.CreateObject("ADODB.Connection")
    conexion2.Open ConnStr
    Set rs = Server.CreateObject("ADODB.Recordset") 
      
        sql = "update tseguimiento_lobby"
        sql = sql & " set id_zona = '" & id_zona & "', id_territorio = '" & id_territorio & "', nombre_lobby='" & nombre_lobby & "', num_atms='" & num_atms & "',"
        sql = sql & " fecha_autorizacion_voboCanales = '" & fecha_autorizacion_voboCanales & "', estatus_arrendamiento='" & estatus_arrendamiento & "', fecha_entrega_local_arrendamiento='" & fecha_entrega_local_arrendamiento & "', fecha_entrega_anteproyecto='" & fecha_entrega_anteproyecto & "',"
        sql = sql & " vobo_canales_anteproyecto = '" & vobo_canales_anteproyecto & "', estatus_ingenieria='" & estatus_ingenieria & "', fecha_entrega_ingenieria='" & fecha_entrega_ingenieria & "', concurso_asignacion_proveedor='" & concurso_asignacion_proveedor & "', "
        sql = sql & " id_proveedor = '" & id_proveedor & "', id_supervisor='" & id_supervisor & "', estatus_permisos='" & estatus_permisos & "', fecha_entrega_comercial='" & fecha_entrega_comercial & "', estatus_produccion='" & estatus_produccion & "', "
        sql = sql & " fecha_inicio_obra = '" & fecha_inicio_obra & "',"
        sql = sql & " inicio_reprogramado = '" & inicio_reprogramado & "',"
        sql = sql & " fin_reprogramado = '" & fin_reprogramado & "'"
        'fecha termino = Inicio Programado + 70 
       '' sql = sql & "fecha_termino_obra=DATE_ADD(fecha_inicio_obra,INTERVAL 70 day),"
        'TRABAJOS FINALES = Inicio Programado + 70 
'        'sql = sql & "trabajos_finales_fechaProgramada=DATE_ADD(fecha_inicio_obra,INTERVAL 70 day)"
        sql = sql & " where id_lobby = '" & id_lobby & "'" 
    
        conexion2.Execute sql
   
       sql= "UPDATE tseguimiento_lobby SET fecha_termino_obra = CASE WHEN inicio_Reprogramado IS NULL THEN DATE_ADD( fecha_inicio_obra, INTERVAL 70 DAY) WHEN inicio_Reprogramado = '' THEN DATE_ADD( fecha_inicio_obra, INTERVAL 70 DAY) ELSE DATE_ADD( inicio_Reprogramado, INTERVAL 70 DAY) END, trabajos_finales_fechaProgramada = CASE WHEN inicio_Reprogramado IS NULL THEN DATE_ADD( fecha_inicio_obra, INTERVAL 70 DAY) WHEN inicio_Reprogramado = '' THEN DATE_ADD( fecha_inicio_obra, INTERVAL 70 DAY) ELSE DATE_ADD( inicio_Reprogramado, INTERVAL 70 DAY) END WHERE id_lobby ='" & id_lobby & "'" 

        conexion2.Execute sql

        if err<>0 then 
            conexion2.Close
            set conexion2=nothing  
            regresar="errI"
        else   

            sql = "update tseguimiento_lobby"
            sql = sql & " set "
            'Numero de semanas = fecha termino - fecha inicio / 7
            sql = sql & "No_semanas=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') AND( fin_Reprogramado IS NULL OR fin_reprogramado = '') THEN DATEDIFF( fecha_termino_obra, fecha_inicio_obra) / 7 WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') AND( fin_Reprogramado IS NULL OR fin_reprogramado = '') THEN DATEDIFF( fecha_termino_obra, inicio_Reprogramado) / 7 WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') AND NOT( fin_Reprogramado IS NULL OR fin_reprogramado = '') THEN DATEDIFF( fin_Reprogramado, fecha_inicio_obra) / 7 WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') AND NOT( fin_Reprogramado IS NULL OR fin_reprogramado = '') THEN DATEDIFF( fin_Reprogramado, inicio_Reprogramado) / 7 END,"
            'Entrega a comercial = fecha termino - fecha inicio / 7
            sql = sql & "fecha_entrega_comercial=CASE WHEN( fin_Reprogramado IS NULL OR fin_reprogramado = '') THEN DATE_ADD( fecha_termino_obra, INTERVAL 7 DAY) WHEN NOT( fin_Reprogramado IS NULL OR fin_reprogramado = '') THEN DATE_ADD( fin_Reprogramado, INTERVAL 7 DAY) END,"
            'PRELIMINARES = fecha inicio +3
            sql = sql & "preliminares_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 3 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 3 DAY) END,"
            'ALBAÑILERIA = fecha inicio +22
            sql = sql & "albanileria_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 22 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 22 DAY) END,"
            'TABLAROCA = fecha inicio +11
            sql = sql & "tablaroca_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 11 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 11 DAY) END,"
            'CARPINTERIA = fecha TRABAJOS FINALES -12
            sql = sql & "carpinteria_fechaProgramada=DATE_ADD(trabajos_finales_fechaProgramada,INTERVAL -12 day),"
            'CANCELERIA = fecha TRABAJOS FINALES -20
            sql = sql & "canceleria_fechaProgramada=DATE_ADD(trabajos_finales_fechaProgramada,INTERVAL -20 day),"
            'HERRERIA = fecha inicio +23
            sql = sql & "herreria_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 23 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 23 DAY) END,"
            'INST. ELECTRICAS = TRABAJOS FINALES -21
            sql = sql & "instalacion_electrica_fechaProgramada=DATE_ADD(trabajos_finales_fechaProgramada,INTERVAL -21 day),"
            'SEGURIDAD, VOZ Y DATOS = TRABAJOS FINALES -21
            sql = sql & "seg_voz_datos_fechaProgramada=DATE_ADD(trabajos_finales_fechaProgramada,INTERVAL -21 day),"
            'AIRE ACONDICIONADO = TRABAJOS FINALES -16
            sql = sql & "aire_acondicionado_fechaProgramada=DATE_ADD(trabajos_finales_fechaProgramada,INTERVAL -16 day),"
            'ACABADOS = TRABAJOS FINALES -8
            sql = sql & "acabados_fechaProgramada=DATE_ADD(trabajos_finales_fechaProgramada,INTERVAL -8 day),"
            'ILUMINACION = TRABAJOS FINALES -9
            sql = sql & "iluminacion_fechaProgramada=DATE_ADD(trabajos_finales_fechaProgramada,INTERVAL -9 day),"
            'HITO2 = FECHA INICIO
            sql = sql & "hito2_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN fecha_inicio_obra WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN inicio_Reprogramado END,"
            'HITO3 = FECHA INICIO +7
            sql = sql & "hito3_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 7 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 7 DAY) END,"
            'HITO4 = FECHA INICIO +14
            sql = sql & "hito4_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 14 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 14 DAY) END,"
            'HITO5 = FECHA INICIO +15
            sql = sql & "hito5_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 15 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 15 DAY) END,"
            'HITO6 = FECHA INICIO +27
            sql = sql & "hito6_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 27 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 27 DAY) END,"
            'HITO7 = FECHA INICIO +35
            sql = sql & "hito7_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 35 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 35 DAY) END,"
            'HITO8 = FECHA INICIO +36
            sql = sql & "hito8_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 36 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 36 DAY) END,"
            'HITO9 = FECHA INICIO +41
            sql = sql & "hito9_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 41 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 41 DAY) END,"
            'HITO10 = FECHA TERMINO -25
            sql = sql & "hito10_fechaProgramada=CASE WHEN( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fecha_termino_obra, INTERVAL -25 DAY) WHEN NOT( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fin_Reprogramado, INTERVAL -25 DAY) END,"
            'HITO11 = FECHA TERMINO -25
            sql = sql & "hito11_fechaProgramada=CASE WHEN( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fecha_termino_obra, INTERVAL -25 DAY) WHEN NOT( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fin_Reprogramado, INTERVAL -25 DAY) END,"
            'HITO12 = FECHA TERMINO -21
            sql = sql & "hito12_fechaProgramada=CASE WHEN( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fecha_termino_obra, INTERVAL -21 DAY) WHEN NOT( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fin_Reprogramado, INTERVAL -21 DAY) END,"
            'HITO13 = FECHA INICIO 56
            sql = sql & "hito13_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 56 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 56 DAY) END,"
            'HITO14 = FECHA INICIO 59
            sql = sql & "hito14_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 59 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 59 DAY) END,"
            'HITO15 = FECHA INICIO 60
            sql = sql & "hito15_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 60 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 60 DAY) END,"
            'HITO16 = FECHA TERMINO -8
            sql = sql & "hito16_fechaProgramada=CASE WHEN( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fecha_termino_obra, INTERVAL -8 DAY) WHEN NOT( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fin_Reprogramado, INTERVAL -8 DAY) END,"
            'HITO17 = FECHA INICIO +35
            sql = sql & "hito17_fechaProgramada=CASE WHEN( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( fecha_inicio_obra, INTERVAL 35 DAY) WHEN NOT( inicio_Reprogramado IS NULL OR inicio_Reprogramado = '') THEN DATE_ADD( inicio_Reprogramado, INTERVAL 35 DAY) END,"
            'HITO18 = FECHA TERMINO -23
            sql = sql & "hito18_fechaProgramada=CASE WHEN( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fecha_termino_obra, INTERVAL -23 DAY) WHEN NOT( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fin_Reprogramado, INTERVAL -23 DAY) END,"
            'HITO19 = FECHA TERMINO -20
            sql = sql & "hito19_fechaProgramada=CASE WHEN( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fecha_termino_obra, INTERVAL -20 DAY) WHEN NOT( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fin_Reprogramado, INTERVAL -20 DAY) END,"
            'HITO20 = FECHA TERMINO -7
            sql = sql & "hito20_fechaProgramada=CASE WHEN( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fecha_termino_obra, INTERVAL -7 DAY) WHEN NOT( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN DATE_ADD( fin_Reprogramado, INTERVAL -7 DAY) END,"
            'HITO21 = FECHA TERMINO
            sql = sql & "hito21_fechaProgramada=CASE WHEN( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN fecha_termino_obra WHEN NOT( fin_Reprogramado IS NULL OR fin_Reprogramado = '') THEN fin_Reprogramado END"
            sql = sql & " where id_lobby = '" & id_lobby & "'" 
    
            conexion2.Execute   sql   
   
            if err<>0 then 
                conexion2.Close
                set conexion2=nothing  
                regresar="errI"
            else
                conexion2.Close
                set conexion2=nothing  
                regresar="ok"
            end if
        end if

        response.Redirect("controlAcciones_adminLobby.asp?estatusActualizacion=" & regresar)
%>
