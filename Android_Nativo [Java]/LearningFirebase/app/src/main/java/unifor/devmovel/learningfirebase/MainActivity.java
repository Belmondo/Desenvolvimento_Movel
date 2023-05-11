package unifor.devmovel.learningfirebase;

import android.os.Bundle;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentActivity;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.firestore.DocumentReference;
import com.google.firebase.firestore.DocumentSnapshot;
import com.google.firebase.firestore.FirebaseFirestore;


public class MainActivity extends AppCompatActivity {

    TextView tvWelcome;
    DocumentReference documentReference;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tvWelcome = (TextView) findViewById(R.id.logo_name);


        documentReference = FirebaseFirestore.getInstance().
                collection("User").
                document("oz2Rd0QH05RFQKzhaQnVA76YT223");

        documentReference.get().addOnSuccessListener(new OnSuccessListener<DocumentSnapshot>() {
            @Override
            public void onSuccess(DocumentSnapshot documentSnapshot) {

                UserModel userModel = documentSnapshot.toObject(UserModel.class);

                tvWelcome
                        .setText("Olá, Bem-vindo " + userModel.getSenha());


            }
        });


    }
}