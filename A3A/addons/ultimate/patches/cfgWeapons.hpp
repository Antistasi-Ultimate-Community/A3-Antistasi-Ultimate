// class TFAR_anprc152;
class TFAR_SCR536: ItemRadio 
{
    author = AUTHOR;
    displayName = "SCR-536";
    descriptionShort = "SCR-536";
    scope = 2;
    scopeCurator = 2;
    model = QPATHTOFOLDER(patches\scr536.p3d);
    picture = QPATHTOFOLDER(patches\data\scr536_ca.paa);
    tf_prototype = 1;
    tf_range = 1000;
    tf_dialog = "scr536_radio_dialog";
    // tf_dialog = "anprc152_radio_dialog";
    tf_encryptionCode = "tf_west_radio_code";
    tf_dialogUpdate = "call TFAR_fnc_updateSWDialogToChannel;";
    tf_subtype = "digital";
    tf_parent = "TFAR_SCR536";
    tf_additional_channel = 1;
};

class TFAR_SCR536_1: TFAR_SCR536 
{
    displayName = "SCR-536 1";
    scope=1;
    scopeCurator=1;
    scopeArsenal=1;
    ace_arsenal_hide=1;
    tf_prototype=0;
    tf_radio=1;
    ace_arsenal_uniqueBase="TFAR_SCR536";
};

#include "radios.hpp"

// TF_RADIO_IDS(TFAR_SCR536,SCR536)
