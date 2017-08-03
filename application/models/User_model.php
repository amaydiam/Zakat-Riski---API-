<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @property User_model $User_model
 */
class User_model extends CI_Model
{

    public function insertuser($user)
    {
        $query = $this->db->insert('user', $user);
        return $query;
    }


    public function cekusername($username)
    {
        $this->db
            ->select("*");
        $this->db->from('user');
        $this->db->where('username', $username);
        $query = $this->db->get();

        return $query->row_array();
    }

    public function login($username, $password)
    {
        $this->db
            ->select("user.*
    , amil_zakat.id_amil_zakat
    , badan_amil_zakat.id_badan_amil_zakat
    , badan_amil_zakat.nama_badan_amil_zakat");
        $this->db->from('amil_zakat');
        $this->db->join('badan_amil_zakat', 'amil_zakat.id_badan_amil_zakat = badan_amil_zakat.id_badan_amil_zakat');
        $this->db->join('user', 'amil_zakat.id_user = user.id_user', 'right');
        $this->db->where('username', $username);
        $this->db->where('password', $password);
        $query = $this->db->get();


        return $query->row_array();
    }

}