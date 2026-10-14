MODULE GadgetsTest;  (** GadgetsTest.Run: the gadget classes made, given attributes and put into a panel; needs the desktop's display *)

IMPORT Objects, Display, Gadgets, Attributes, Panels, Documents, TextDocs, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Make(gen: ARRAY OF CHAR): Objects.Object;
VAR obj: Objects.Object;
BEGIN
  obj := Gadgets.CreateObject(gen); Check(gen, obj # NIL); RETURN obj
END Make;

PROCEDURE Run*;
VAR obj, panel: Objects.Object; s: ARRAY 64 OF CHAR; b: BOOLEAN; i: LONGINT; n: INTEGER;
  gens: ARRAY 12 OF ARRAY 40 OF CHAR; doc: Documents.Document;
BEGIN
  fails := 0; checks := 0;
  obj := Make("BasicGadgets.NewButton");
  IF obj # NIL THEN Attributes.SetString(obj, "Caption", "Press"); Attributes.GetString(obj, "Caption", s); Check("Button Caption", s = "Press") END;
  obj := Make("BasicGadgets.NewCheckBox");
  IF obj # NIL THEN Attributes.SetBool(obj, "Value", TRUE); Attributes.GetBool(obj, "Value", b); Check("CheckBox Value", b) END;
  obj := Make("BasicGadgets.NewInteger");
  IF obj # NIL THEN Attributes.SetInt(obj, "Value", 42); Attributes.GetInt(obj, "Value", i); Check("Integer Value", i = 42) END;
  obj := Make("TextFields.NewTextField");
  IF obj # NIL THEN Attributes.SetString(obj, "Value", "abc"); Attributes.GetString(obj, "Value", s); Check("TextField Value", s = "abc") END;
  panel := Make("Panels.NewPanel");
  gens[0] := "BasicGadgets.NewButton"; gens[1] := "BasicGadgets.NewSlider"; gens[2] := "TextFields.NewTextField";
  gens[3] := "ListGadgets.NewFrame"; gens[4] := "Scrollbars.New"; gens[5] := "NamePlates.NewNamePlate";
  gens[6] := "Clocks.NewClock"; gens[7] := "BasicFigures.NewRect"; gens[8] := "TextGadgets.New";
  gens[9] := "TextGadgets.NewNote"; gens[10] := "BasicGadgets.NewCheckBox"; gens[11] := "Clocks.NewCalendar";
  n := 0;
  WHILE n < 12 DO
    obj := Make(gens[n]);
    IF (panel # NIL) & (obj # NIL) & (obj IS Display.Frame) THEN Panels.InsertChild(panel(Panels.Panel), obj(Display.Frame), 10 + n * 5, -20 - n * 10) END;
    INC(n)
  END;
  IF panel # NIL THEN
    n := 0; obj := panel(Panels.Panel).dsc; WHILE obj # NIL DO INC(n); obj := obj(Display.Frame).next END;
    Check("panel has its 12 children", n = 12)
  END;
  doc := Documents.Open("GadgetsTest.Mod"); Check("a text document", (doc # NIL) & (doc.dsc # NIL));
  Out.String("GadgetsTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END GadgetsTest.
