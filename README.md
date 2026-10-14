# gadgets

The Gadgets system of ETH Oberon System 3 for [polpo](https://github.com/polpo-system/polpo): the
component framework of the Oberon desktop and its standard classes. Gadgets are optional: polpo's
desktop works without them, and the applications and games built on them are packages of their
own (`gadgets-...` in the `gadgets` category of arden).

```
portia.Install gadgets
```

## What is here

    src/Attributes, Links, Display3, Effects, Printer3, Gadgets     the framework
    src/Panels, Documents, Desktops (OLR.Desktops), Views, Icons    panels, documents, desktops
    src/BasicGadgets, BasicFigures, TextFields, TextGadgets0,       the standard classes: buttons,
        TextGadgets, Scrollbars, NamePlates, Organizers, Clocks,    check boxes, sliders, text
        SetGadgets, RefGadgets, ScrollViews, Gages,                 fields, texts and notes,
        ProgressMeters, Navigators, NoteBooks, TimeStamps           figures, clocks, gauges ...
    src/Lists (OLR.Lists), ListRiders, ListModels, ListDags,        lists, trees, directories
        ListGadgets
    src/TextDocs, PanelDocs                                         text and panel documents
    src/Columbus, GadgetsIn, GadgetsOut                             the inspector, gadget I/O
    share/  TextDocs.Lib, Icons.Lib, Columbus.Lib, Symbols.Lib, the panels Gadgets, Documents,
            Libraries and TextDocs, the pictures Default, Backdrop and Gadgets
    tools/TextDocs.Tool
    test/GadgetsTest.Mod

The sources come from ETH Linux Oberon (OLR, 2017-06-18), converted to plain text; the first
commit has them unchanged, changes for polpo follow, one commit each. They compile unchanged with
all five of polpo's compilers (x86, ARM, ARMv7, RISC-V, MIPS). TextPopups (popup menus for texts)
is not here: it reads source texts with the scanner of the x86 compiler and becomes a package of
its own. `SetGadgets` needs `BIT`, from the package bit.

## Using

    Desktops.OpenDoc Gadgets.Panel      the toolkit: classes to insert, and commands
    Desktops.OpenDoc Libraries.Panel    object libraries
    Gadgets.Insert Button ~             a button at the caret (the names are the Aliases of
                                        Gadgets in Oberon.Text)
    TextDocs.NewDoc, PanelDocs.NewDoc   new documents
    Columbus.Inspect                    the attributes of the selected gadget

The panels were laid out for a font scale of 100%. polpo scales the screen fonts (150% by
default, `System.SetFontScale`), and a panel keeps its gadgets where they were, so their captions
can overlap; `System.SetFontScale 100` shows them as designed.

## Tests

    GadgetsTest.Run      23 checks: the standard gadgets made, given attributes and put into a
                         panel, a text document opened; it needs the desktop's display

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
