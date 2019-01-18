<HTML>
<HEAD>
<TITLE>AspPDF Template Fill-out Demo</TITLE>

<script language="JavaScript">
/*
function Validate()
{
	if( Form.Name.value == "" && Form.BusinessName.value == "" )
	{
		alert('Either Name or Business Name fields must be filled in.' );
		Form.Name.focus();
		return false;
	}

	if( Form.Type[3].checked && Form.Other.value == "" )
	{
		alert('Business type must be filled in.' );
		Form.Other.focus();
		return false;
	}

	if( Form.Address.value == "" )
	{
		alert('Address must be filled in.' );
		Form.Address.focus();
		return false;
	}

	if( Form.City.value == "" )
	{
		alert('City must be filled in.' );
		Form.City.focus();
		return false;
	}

	if( Form.State.value == "" )
	{
		alert('State must be filled in.' );
		Form.State.focus();
		return false;
	}

	if( Form.Zip.value == "" )
	{
		alert('Zip must be filled in.' );
		Form.Zip.focus();
		return false;
	}

	if( !Form.TIN[0].checked && !Form.TIN[1].checked )
	{
		alert('You must select either SSN or EIN.' );
		Form.SSN.focus();
		return false;
	}

	if( Form.TIN[0].checked && Form.SSN.value == "" )
	{
		alert('SSN must be filled in.' );
		Form.SSN.focus();
		return false;
	}

	if( Form.TIN[1].checked && Form.EIN.value == "" )
	{
		alert('EIN must be filled in.' );
		Form.EIN.focus();
		return false;
	}

	return true;
}
*/
</script>

</HEAD>
<BODY>



<%
perro=request("name")


		Set PDF = Server.CreateObject("Persits.PDF")

		' Open an existing document, form W-9
		Set Doc = PDF.OpenDocument( Server.MapPath( "images/w9.pdf" ) )

		' Obtain Page object for page 1
		Set Page = Doc.Pages(1)

		' Create empty param object to be used throughout application
		Set Param = PDF.CreateParam

		' Create font object
		Set Font = Doc.Fonts("Helvetica-Bold")
		
		'*********
		' SUCURSAL
		'++ maximo 55 caracteres +++++
		Param.Add("x=20, y=730")
		'Param.Add("size=10")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmretyuimngokñwh" , Param, Font
		'++ maximo 22 caracteres +++++
		' CR
		Param.Add("x=335, y=730")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font
		' REGIONAL
		Param.Add("x=467, y=730")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font
		'*********
		' CONTRATISTA
		Param.Add("x=20, y=705")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmretyuimngokñwh", Param, Font
		' TIPO DE REMODELACION
		Param.Add("x=335, y=705")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font
		' TIPO DE REMODELACION
		Param.Add("x=467, y=705")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font	
			
		'*****SEÑALIZACION EXTERIOR********
		'*****EXTERIOR********
		'*****COND************
		' 1
		Param.Add("x=341, y=660")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=648.7")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=637.4")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=626")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=614.7")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****OBSERVACIONES************
		'++ maximo 43 caracteres +++++
		' 1
		Param.Add("x=365, y=660")
		Page.Canvas.DrawText "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmre", Param, Font
		' 2
		Param.Add("x=365, y=648.7")
		Page.Canvas.DrawText "se compromete a entregarlo el 22 de julio", Param, Font
		' 3
		Param.Add("x=365, y=637.4")
		Page.Canvas.DrawText "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmre", Param, Font
		' 4
		Param.Add("x=365, y=626")
		Page.Canvas.DrawText "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmre", Param, Font
		' 5
		Param.Add("x=365, y=614.7")
		Page.Canvas.DrawText "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmre", Param, Font
		
		'*****OBRA CIVIL Y ACABADOS********
		'*****FACHADA********
		'*****COND************
		' 1
		Param.Add("x=341, y=590.5")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=579")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=567.5")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=556")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=544.5")
		Page.Canvas.DrawText "E", Param, Font
		' 
		Param.Add("x=341, y=533")
		Page.Canvas.DrawText "E", Param, Font
		' 7
		Param.Add("x=341, y=521.5")
		Page.Canvas.DrawText "E", Param, Font
		' 8
		Param.Add("x=341, y=510")
		Page.Canvas.DrawText "E", Param, Font
		' 9
		Param.Add("x=341, y=498.5")
		Page.Canvas.DrawText "E", Param, Font
		' 10
		Param.Add("x=341, y=487")
		Page.Canvas.DrawText "E", Param, Font
		' 11
		Param.Add("x=341, y=475.5")
		Page.Canvas.DrawText "E", Param, Font
		' 12
		Param.Add("x=341, y=464")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****FACHADA********
		'*****OBSERVACIONES************
		'++ maximo 43 caracteres +++++
		' 1
		Param.Add("x=365, y=590.5")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=579")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=567.5")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=556")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=544.5")
		Page.Canvas.DrawText "E", Param, Font
		' 
		Param.Add("x=365, y=533")
		Page.Canvas.DrawText "E", Param, Font
		' 7
		Param.Add("x=365, y=521.5")
		Page.Canvas.DrawText "E", Param, Font
		' 8
		Param.Add("x=365, y=510")
		Page.Canvas.DrawText "E", Param, Font
		' 9
		Param.Add("x=365, y=498.5")
		Page.Canvas.DrawText "E", Param, Font
		' 10
		Param.Add("x=365, y=487")
		Page.Canvas.DrawText "E", Param, Font
		' 11
		Param.Add("x=365, y=475.5")
		Page.Canvas.DrawText "E", Param, Font
		' 12
		Param.Add("x=365, y=464")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****LOBBY********
		'*****COND************
		' 1
		Param.Add("x=341, y=452.5")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=441")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=429.5")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=418")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=406.5")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=341, y=395")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=341, y=383.5")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=341, y=372")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=341, y=360.5")
		Page.Canvas.DrawText "E", Param, Font
		'10
		Param.Add("x=341, y=349")
		Page.Canvas.DrawText "E", Param, Font
		'11
		Param.Add("x=341, y=337.5")
		Page.Canvas.DrawText "E", Param, Font
		'12
		Param.Add("x=341, y=326")
		Page.Canvas.DrawText "E", Param, Font
		'13
		Param.Add("x=341, y=314.5")
		Page.Canvas.DrawText "E", Param, Font
		'14
		Param.Add("x=341, y=303")
		Page.Canvas.DrawText "E", Param, Font
		'15
		Param.Add("x=341, y=291.5")
		Page.Canvas.DrawText "E", Param, Font
		'16
		Param.Add("x=341, y=280")
		Page.Canvas.DrawText "E", Param, Font
		'17
		Param.Add("x=341, y=268.5")
		Page.Canvas.DrawText "E", Param, Font
		'18
		Param.Add("x=341, y=257")
		Page.Canvas.DrawText "E", Param, Font
		'19
		Param.Add("x=341, y=245.5")
		Page.Canvas.DrawText "E", Param, Font
		'20
		Param.Add("x=341, y=234")
		Page.Canvas.DrawText "E", Param, Font
		'21
		Param.Add("x=341, y=222.5")
		Page.Canvas.DrawText "E", Param, Font
		'22
		Param.Add("x=341, y=211")
		Page.Canvas.DrawText "E", Param, Font
		'23
		Param.Add("x=341, y=199.5")
		Page.Canvas.DrawText "E", Param, Font
		'24
		Param.Add("x=341, y=188")
		Page.Canvas.DrawText "E", Param, Font
		'25
		Param.Add("x=341, y=176.5")
		Page.Canvas.DrawText "E", Param, Font
		'26
		Param.Add("x=341, y=165")
		Page.Canvas.DrawText "E", Param, Font
		'27
		Param.Add("x=341, y=153.5")
		Page.Canvas.DrawText "E", Param, Font
		'28
		Param.Add("x=341, y=142")
		Page.Canvas.DrawText "E", Param, Font
		'29
		Param.Add("x=341, y=130.5")
		Page.Canvas.DrawText "E", Param, Font
		'30
		Param.Add("x=341, y=119")
		Page.Canvas.DrawText "E", Param, Font
		'31
		Param.Add("x=341, y=107.5")
		Page.Canvas.DrawText "E", Param, Font
		'32
		Param.Add("x=341, y=96")
		Page.Canvas.DrawText "E", Param, Font
		'33
		Param.Add("x=341, y=84.5")
		Page.Canvas.DrawText "E", Param, Font
		'34
		Param.Add("x=341, y=73")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****LOBBY********
		'*****OBSERVACIONES************
		'++ maximo 43 caracteres +++++
			' 1
		Param.Add("x=365, y=452.5")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=441")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=429.5")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=418")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=406.5")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=365, y=395")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=365, y=383.5")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=365, y=372")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=365, y=360.5")
		Page.Canvas.DrawText "E", Param, Font
		'10
		Param.Add("x=365, y=349")
		Page.Canvas.DrawText "E", Param, Font
		'11
		Param.Add("x=365, y=337.5")
		Page.Canvas.DrawText "E", Param, Font
		'12
		Param.Add("x=365, y=326")
		Page.Canvas.DrawText "E", Param, Font
		'13
		Param.Add("x=365, y=314.5")
		Page.Canvas.DrawText "E", Param, Font
		'14
		Param.Add("x=365, y=303")
		Page.Canvas.DrawText "E", Param, Font
		'15
		Param.Add("x=365, y=291.5")
		Page.Canvas.DrawText "E", Param, Font
		'16
		Param.Add("x=365, y=280")
		Page.Canvas.DrawText "E", Param, Font
		'17
		Param.Add("x=365, y=268.5")
		Page.Canvas.DrawText "E", Param, Font
		'18
		Param.Add("x=365, y=257")
		Page.Canvas.DrawText "E", Param, Font
		'19
		Param.Add("x=365, y=245.5")
		Page.Canvas.DrawText "E", Param, Font
		'20
		Param.Add("x=365, y=234")
		Page.Canvas.DrawText "E", Param, Font
		'21
		Param.Add("x=365, y=222.5")
		Page.Canvas.DrawText "E", Param, Font
		'22
		Param.Add("x=365, y=211")
		Page.Canvas.DrawText "E", Param, Font
		'23
		Param.Add("x=365, y=199.5")
		Page.Canvas.DrawText "E", Param, Font
		'24
		Param.Add("x=365, y=188")
		Page.Canvas.DrawText "E", Param, Font
		'25
		Param.Add("x=365, y=176.5")
		Page.Canvas.DrawText "E", Param, Font
		'26
		Param.Add("x=365, y=165")
		Page.Canvas.DrawText "E", Param, Font
		'27
		Param.Add("x=365, y=153.5")
		Page.Canvas.DrawText "E", Param, Font
		'28
		Param.Add("x=365, y=142")
		Page.Canvas.DrawText "E", Param, Font
		'29
		Param.Add("x=365, y=130.5")
		Page.Canvas.DrawText "E", Param, Font
		'30
		Param.Add("x=365, y=119")
		Page.Canvas.DrawText "E", Param, Font
		'31
		Param.Add("x=365, y=107.5")
		Page.Canvas.DrawText "E", Param, Font
		'32
		Param.Add("x=365, y=96")
		Page.Canvas.DrawText "E", Param, Font
		'33
		Param.Add("x=365, y=84.5")
		Page.Canvas.DrawText "E", Param, Font
		'34
		Param.Add("x=365, y=73")
		Page.Canvas.DrawText "E", Param, Font
'+++++++++++++++ HOJA 2 +++++++++++++++++++++++
		' Obtain Page object for page 2
		Set Page = Doc.Pages(2)
		
		'*********
		' SUCURSAL
		'++ maximo 55 caracteres +++++
		Param.Add("x=20, y=730")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmretyuimngokñwh" , Param, Font
		'++ maximo 22 caracteres +++++
		' CR
		Param.Add("x=335, y=730")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font
		' REGIONAL
		Param.Add("x=467, y=730")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font
		'*********
		' CONTRATISTA
		Param.Add("x=20, y=705")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmretyuimngokñwh", Param, Font
		' TIPO DE REMODELACION
		Param.Add("x=335, y=705")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font
		' TIPO DE REMODELACION
		Param.Add("x=467, y=705")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font		
		
		'*****OBRA CIVIL Y ACABADOS********
		'*****PATIO PUBLICO********
		'*****COND************
		' 1
		Param.Add("x=341, y=672")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=660.5")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=649")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=637.5")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=626")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=341, y=614.5")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=341, y=603")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=341, y=591.5")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=341, y=580")
		Page.Canvas.DrawText "E", Param, Font
		'10
		Param.Add("x=341, y=568.5")
		Page.Canvas.DrawText "E", Param, Font
		'11
		Param.Add("x=341, y=557")
		Page.Canvas.DrawText "E", Param, Font
		'12
		Param.Add("x=341, y=545.5")
		Page.Canvas.DrawText "E", Param, Font
		'13
		Param.Add("x=341, y=534")
		Page.Canvas.DrawText "E", Param, Font
		'14
		Param.Add("x=341, y=522.5")
		Page.Canvas.DrawText "E", Param, Font
		'15
		Param.Add("x=341, y=511")
		Page.Canvas.DrawText "E", Param, Font
		'16
		Param.Add("x=341, y=499.5")
		Page.Canvas.DrawText "E", Param, Font
		'17
		Param.Add("x=341, y=488")
		Page.Canvas.DrawText "E", Param, Font
		'18
		Param.Add("x=341, y=476.5")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****PATIO PUBLICO********
		'*****OBSERVACIONES************
		
		' 1
		Param.Add("x=365, y=672")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=660.5")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=649")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=637.5")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=626")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=365, y=614.5")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=365, y=603")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=365, y=591.5")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=365, y=580")
		Page.Canvas.DrawText "E", Param, Font
		'10
		Param.Add("x=365, y=568.5")
		Page.Canvas.DrawText "E", Param, Font
		'11
		Param.Add("x=365, y=557")
		Page.Canvas.DrawText "E", Param, Font
		'12
		Param.Add("x=365, y=545.5")
		Page.Canvas.DrawText "E", Param, Font
		'13
		Param.Add("x=365, y=534")
		Page.Canvas.DrawText "E", Param, Font
		'14
		Param.Add("x=365, y=522.5")
		Page.Canvas.DrawText "E", Param, Font
		'15
		Param.Add("x=365, y=511")
		Page.Canvas.DrawText "E", Param, Font
		'16
		Param.Add("x=365, y=499.5")
		Page.Canvas.DrawText "E", Param, Font
		'17
		Param.Add("x=365, y=488")
		Page.Canvas.DrawText "E", Param, Font
		'18
		Param.Add("x=365, y=476.5")
		Page.Canvas.DrawText "E", Param, Font

		'*****AREA DE CAJAS********
		'*****COND************
		' 1
		Param.Add("x=341, y=465")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=453.5")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=442")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=430.5")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=419")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=341, y=407.5")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=341, y=396")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=341, y=384.5")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=341, y=373")
		Page.Canvas.DrawText "E", Param, Font

		'*****AREA DE CAJAS********
		'*****OBSERVACIONES************
		
		' 1
		Param.Add("x=365, y=465")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=453.5")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=442")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=430.5")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=419")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=365, y=407.5")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=365, y=396")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=365, y=384.5")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=365, y=373")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****AREA DE DOTACION********
		'*****COND************
		' 1
		Param.Add("x=341, y=361.5")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=350")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=338.5")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=327")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=315.5")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=341, y=304")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=341, y=292.5")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=341, y=281")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=341, y=269.5")
		Page.Canvas.DrawText "E", Param, Font
		'10
		Param.Add("x=341, y=258")
		Page.Canvas.DrawText "E", Param, Font
		'11
		Param.Add("x=341, y=246.5")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****AREA DE DOTACION********
		'*****OBSERVACIONES************

		' 1
		Param.Add("x=365, y=361.5")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=350")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=338.5")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=327")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=315.5")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=365, y=304")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=365, y=292.5")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=365, y=281")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=365, y=269.5")
		Page.Canvas.DrawText "E", Param, Font
		'10
		Param.Add("x=365, y=258")
		Page.Canvas.DrawText "E", Param, Font
		'11
		Param.Add("x=365, y=246.5")
		Page.Canvas.DrawText "E", Param, Font

		'*****INSTALACIONES ELECTRICAS********
		'*****LOBBY********
		'*****COND************
		' 1
		Param.Add("x=341, y=222")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=210.5")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=199")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=187.5")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=176")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=341, y=164.5")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=341, y=153")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=341, y=141.5")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****LOBBY********
		'*****OBSERVACIONES************
		' 1
		Param.Add("x=365, y=222")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=210.5")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=199")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=187.5")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=176")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=365, y=164.5")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=365, y=153")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=365, y=141.5")
		Page.Canvas.DrawText "E", Param, Font



		'*****AIRE ACONDICIONADO********
		'*****LOBBY********
		'*****COND************
		' 1
		Param.Add("x=341, y=117.5")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=106")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=94.5")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=83")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=71.5")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=341, y=60")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=341, y=48.5")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****LOBBY********
		'*****OBSERVACIONES************
		' 1
		Param.Add("x=365, y=117.5")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=106")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=94.5")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=83")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=71.5")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=365, y=60")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=365, y=48.5")
		Page.Canvas.DrawText "E", Param, Font

'+++++++++++++++ HOJA 3 +++++++++++++++++++++++
		' Obtain Page object for page 3
		Set Page = Doc.Pages(3)
		
		'*********
		' SUCURSAL
		'++ maximo 55 caracteres +++++
		Param.Add("x=20, y=730")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmretyuimngokñwh" , Param, Font
		'++ maximo 22 caracteres +++++
		' CR
		Param.Add("x=335, y=730")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font
		' REGIONAL
		Param.Add("x=467, y=730")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font
		'*********
		' CONTRATISTA
		Param.Add("x=20, y=705")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkljmretyuimngokñwh", Param, Font
		' TIPO DE REMODELACION
		Param.Add("x=335, y=705")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font
		' TIPO DE REMODELACION
		Param.Add("x=467, y=705")
		Page.Canvas.DrawText perro & "Ewergskdjeqwertoujkwwq", Param, Font		
		
		'*****AIRE ACONDICIONADO********
		'*****LOBBY********
		'*****COND************
		' 1
		Param.Add("x=341, y=672")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=660.5")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=649")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=637.5")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=626")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=341, y=614.5")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=341, y=603")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=341, y=591.5")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=341, y=580")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****LOBBY********
		'*****OBSERVACIONES************
		' 1
		Param.Add("x=365, y=672")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=660.5")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=649")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=637.5")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=626")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=365, y=614.5")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=365, y=603")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=365, y=591.5")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=365, y=580")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****AZOTEA********
		'*****COND************
		'1
		Param.Add("x=341, y=568.5")
		Page.Canvas.DrawText "E", Param, Font
		'2
		Param.Add("x=341, y=557")
		Page.Canvas.DrawText "E", Param, Font
		'3
		Param.Add("x=341, y=545.5")
		Page.Canvas.DrawText "E", Param, Font
		'4
		Param.Add("x=341, y=534")
		Page.Canvas.DrawText "E", Param, Font
		'5
		Param.Add("x=341, y=522.5")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****AZOTEA********
		'*****OBSERVACIONES************
		'1
		Param.Add("x=365, y=568.5")
		Page.Canvas.DrawText "E", Param, Font
		'2
		Param.Add("x=365, y=557")
		Page.Canvas.DrawText "E", Param, Font
		'3
		Param.Add("x=365, y=545.5")
		Page.Canvas.DrawText "E", Param, Font
		'4
		Param.Add("x=365, y=534")
		Page.Canvas.DrawText "E", Param, Font
		'5
		Param.Add("x=365, y=522.5")
		Page.Canvas.DrawText "E", Param, Font

		'*****TABLEROS********
		'*****TIPO************
		'+++++MAXIMO 9 CARACTERES ++++++
		'1
		Param.Add("x=265, y=482")
		Page.Canvas.DrawText "EWMJJFHFJF", Param, Font
		'2
		Param.Add("x=265, y=470.5")
		Page.Canvas.DrawText "EWMJJFHFJ", Param, Font
		'3
		Param.Add("x=265, y=459")
		Page.Canvas.DrawText "EWWK", Param, Font
		'4
		Param.Add("x=265, y=447.5")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****TABLEROS********
		'*****COND************
		'1
		Param.Add("x=341, y=482")
		Page.Canvas.DrawText "E", Param, Font
		'2
		Param.Add("x=341, y=470.5")
		Page.Canvas.DrawText "E", Param, Font
		'3
		Param.Add("x=341, y=459")
		Page.Canvas.DrawText "E", Param, Font
		'4
		Param.Add("x=341, y=447.5")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****TABLEROS********
		'*****LECTURAS O COMENTARIOS************
		' 1
		Param.Add("x=365, y=482")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=392, y=470.5")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=392, y=459")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=392, y=447.5")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****TABLEROS********
		'*****LECTURAS O COMENTARIOS************
		' 2.1
		Param.Add("x=476, y=470.5")
		Page.Canvas.DrawText "EHKROW", Param, Font
		' 3.1
		Param.Add("x=476, y=459")
		Page.Canvas.DrawText "EHKROWTR", Param, Font
		' 4.1
		Param.Add("x=476, y=447.5")
		Page.Canvas.DrawText "EHKROWRJK", Param, Font
		
		'*****TABLEROS********
		'*****LECTURAS O COMENTARIOS************
		' 2.2
		Param.Add("x=560, y=470.5")
		Page.Canvas.DrawText "EHKR", Param, Font
		' 3.3
		Param.Add("x=560, y=459")
		Page.Canvas.DrawText "EHKRO", Param, Font
		' 4.3
		Param.Add("x=560, y=447.5")
		Page.Canvas.DrawText "EHKROW", Param, Font
		
		'*****EQUIPOS DE AIRE ACONDICIONADO********
		'*****TIPO************
		Param.Add("x=19, y=410")
		Page.Canvas.DrawText "EWMJJFHFJFWOPWPMQP", Param, Font
		'*****MARCA************
		Param.Add("x=150, y=410")
		Page.Canvas.DrawText "EWMJJFHFJFWOPWPM", Param, Font
		'*****MODELO************
		Param.Add("x=265, y=410")
		Page.Canvas.DrawText "EWMJJFHFJFWOP", Param, Font
		'*****NO. SERIE************
		Param.Add("x=365, y=410")
		Page.Canvas.DrawText "EWMJJFHFJFW", Param, Font
		'*****NO. INVENTARIO************
		Param.Add("x=448, y=410")
		Page.Canvas.DrawText "EWMJJFHFJF", Param, Font
		'*****CAPACIDAD************
		Param.Add("x=530, y=410")
		Page.Canvas.DrawText "EWMJJFHFJF", Param, Font
		
		'*****EQUIPOS DE AIRE ACONDICIONADO********
		'*****SECCION CONDENSACION************
		'***TIPO******
		' 1
		Param.Add("x=265, y=385")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=265, y=373")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=265, y=361")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=265, y=349")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=265, y=337")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=265, y=325")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=265, y=313")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=265, y=301")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=265, y=289")
		Page.Canvas.DrawText "E", Param, Font
		
		'***COND******
		' 1
		Param.Add("x=341, y=385")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=373")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=361")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=349")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=337")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=341, y=325")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=341, y=313")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=341, y=301")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=341, y=289")
		Page.Canvas.DrawText "E", Param, Font
		
		'***LECTURA O COMENTARIOS******
		' 1
		Param.Add("x=365, y=385")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=373")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=361")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=349")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=392, y=337")
		Page.Canvas.DrawText "E", Param, Font
		' 5.2
		Param.Add("x=476, y=337")
		Page.Canvas.DrawText "E", Param, Font
		' 5.3
		Param.Add("x=559, y=337")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=396, y=325")
		Page.Canvas.DrawText "E", Param, Font
		'6.2
		Param.Add("x=478, y=325")
		Page.Canvas.DrawText "E", Param, Font
		'6.2
		Param.Add("x=565, y=325")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=365, y=313")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=365, y=301")
		Page.Canvas.DrawText "E", Param, Font
		'9
		Param.Add("x=365, y=289")
		Page.Canvas.DrawText "E", Param, Font

		'*****EQUIPOS DE AIRE ACONDICIONADO********
		'*****SECCION COMPRES************
		'***TIPO******
		' 1
		Param.Add("x=265, y=277")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=265, y=265")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=265, y=253")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=265, y=241")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=265, y=229")
		Page.Canvas.DrawText "E", Param, Font

		'***COND******
		' 1
		Param.Add("x=341, y=277")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=265")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=253")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=241")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=229")
		Page.Canvas.DrawText "E", Param, Font
		
		'***LECTURA O COMENTARIOS******
		' 1
		Param.Add("x=392, y=277")
		Page.Canvas.DrawText "E", Param, Font
		' 1.2
		Param.Add("x=476, y=277")
		Page.Canvas.DrawText "E", Param, Font
		' 1.3
		Param.Add("x=559, y=277")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=396, y=265")
		Page.Canvas.DrawText "E", Param, Font
		' 2.2
		Param.Add("x=478, y=265")
		Page.Canvas.DrawText "E", Param, Font
		' 2.3
		Param.Add("x=565, y=265")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=376, y=253")
		Page.Canvas.DrawText "E", Param, Font
		' 3.2
		Param.Add("x=458, y=253")
		Page.Canvas.DrawText "E", Param, Font
		' 3.3
		Param.Add("x=531, y=253")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=241")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=229")
		Page.Canvas.DrawText "E", Param, Font

		'*****EQUIPOS DE AIRE ACONDICIONADO********
		'*****SECCION MANEJO DE AIRE************
		'***TIPO******
		' 1
		Param.Add("x=265, y=217")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=265, y=205")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=265, y=193")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=265, y=181")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=265, y=169")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=265, y=157")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=265, y=145")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=265, y=133")
		Page.Canvas.DrawText "E", Param, Font

		'***COND******
		' 1
		Param.Add("x=341, y=217")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=341, y=205")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=341, y=193")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=341, y=181")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=341, y=169")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=341, y=157")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=341, y=145")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=341, y=133")
		Page.Canvas.DrawText "E", Param, Font
		
		'***LECTURA O COMENTARIOS******
		' 1
		Param.Add("x=365, y=217")
		Page.Canvas.DrawText "E", Param, Font
		' 2
		Param.Add("x=365, y=205")
		Page.Canvas.DrawText "E", Param, Font
		' 3
		Param.Add("x=365, y=193")
		Page.Canvas.DrawText "E", Param, Font
		' 4
		Param.Add("x=365, y=181")
		Page.Canvas.DrawText "E", Param, Font
		' 5
		Param.Add("x=365, y=169")
		Page.Canvas.DrawText "E", Param, Font
		'6
		Param.Add("x=392, y=157")
		Page.Canvas.DrawText "E", Param, Font
		'6.2
		Param.Add("x=476, y=157")
		Page.Canvas.DrawText "E", Param, Font
		'6.3
		Param.Add("x=559, y=157")
		Page.Canvas.DrawText "E", Param, Font
		'7
		Param.Add("x=396, y=145")
		Page.Canvas.DrawText "E", Param, Font
		'7.2
		Param.Add("x=478, y=145")
		Page.Canvas.DrawText "E", Param, Font
		'7.3
		Param.Add("x=565, y=145")
		Page.Canvas.DrawText "E", Param, Font
		'8
		Param.Add("x=365, y=133")
		Page.Canvas.DrawText "E", Param, Font
		
		'*****ENTREGA*******
		'++++NOMBRE+++++
		'MAXIMO 45 CARACTERES
		Param.Add("x=50, y=67")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkl" , Param, Font
		
		'++++PUESTO+++++
		'MAXIMO 45 CARACTERES
		Param.Add("x=46, y=53")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkl" , Param, Font
		
		'*****RECIBE*******
		'++++NOMBRE+++++
		'MAXIMO 45 CARACTERES
		Param.Add("x=348, y=67")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkl" , Param, Font
		
		'++++PUESTO+++++
		'MAXIMO 45 CARACTERES
		Param.Add("x=344, y=53")
		Page.Canvas.DrawText perro & "Esdeeeeeeeeeeeeeeeeekqkkkkkkkktthjkjkl" , Param, Font
		
		' We use Session ID for file names
		' false means "do not overwrite"
		' The method returns generated file name
		'Path = Server.MapPath( "files") & "\" & Session.SessionID & ".pdf"
		Path = Server.MapPath( "files") & "\Check list Transformacion_2017.pdf"
		FileName = Doc.Save( Path, false)

		Response.Write "<P><B>Success. Your PDF file <font color=gray>" & FileName & "</font> can be downloaded <A HREF=""files/" & FileName & """><B>here</B></A></B>."
		Set Page = Nothing
		Set Doc = Nothing
		Set Pdf = Nothing

	
%>
<P>
<B><A HREF="demo_fill.zip">Download source code (ASP and ASP.NET/C#) for this demo</A></B>

</BODY>
</HTML>

