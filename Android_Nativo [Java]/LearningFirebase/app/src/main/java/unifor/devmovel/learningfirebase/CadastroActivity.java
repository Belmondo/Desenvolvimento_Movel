package unifor.devmovel.learningfirebase;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;



import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.navigation.NavController;
import androidx.navigation.Navigation;
import androidx.navigation.ui.AppBarConfiguration;
import androidx.navigation.ui.NavigationUI;


import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.firestore.FirebaseFirestore;

import unifor.devmovel.learningfirebase.databinding.ActivityCadastroBinding;

public class CadastroActivity extends AppCompatActivity {

    EditText etUsername, etPassword,etIdade;
    ProgressDialog progressDialog;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cadastro);
        etUsername = (EditText) findViewById(R.id.nome);
        etPassword = (EditText)findViewById(R.id.senha);
        etIdade = (EditText)findViewById(R.id.idade);
        progressDialog = new ProgressDialog(this);


    }
    public void cadastrarUsuario(View view){

        String username = etUsername.getText().toString();
        String password = etPassword.getText().toString();
        int idade  = Integer.parseInt(etIdade.getText().toString());

        progressDialog.show();

        FirebaseAuth.getInstance().createUserWithEmailAndPassword(username,password)
                .addOnSuccessListener(new OnSuccessListener<AuthResult>() {
                    @Override
                    public void onSuccess(AuthResult authResult) {

                        startActivity(new Intent(CadastroActivity.this, LoginActivity.class));
                        progressDialog.cancel();

                        FirebaseFirestore.getInstance().
                                collection("User")
                                .document(FirebaseAuth.getInstance().getUid())
                                .set(new UserModel(username, password, idade));
                    }
                })
                .addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {

                        Toast.makeText(CadastroActivity.this, "FALHOU", Toast.LENGTH_SHORT).show();
                        progressDialog.cancel();
                    }
                });

    }
}