import java.util.List;

public class WildcardInterfaceTest {

    interface validationdto{
        List<? extends DeclarationItem> getitems();
    }

    class RexDeclaration implements validationdto{


        @Override
        public List<RexDeclarationItem> getitems() {
            return null;
        }
    }

    class cenas{
        public void test() {
            validationdto coiso1 = null;
            DeclarationItem coise1 = null;
//            coiso1.getitems().add(coise1); //we are all idiots
        }
    }

    class DeclarationItem{

    }

    class RexDeclarationItem extends DeclarationItem{

    }

}
