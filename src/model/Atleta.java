package model;

public class Atleta {

	private int codigo;
	private String nome;
	private boolean sexo;
	private Pais paisOrigem;
	
	public int getCodigo() {
		return codigo;
	}
	
	public void setCodigo(int codigo)
	{
		this.codigo = codigo;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public boolean isMasculino() {
		return sexo;
	}
	
	public void setSexo(boolean sexo) {
		this.sexo = sexo;
	}
	
	public Pais getPais() {
		return paisOrigem;
	}
	
	public void setPais(Pais paisOrigem) {
		this.paisOrigem = paisOrigem;
	}
}
