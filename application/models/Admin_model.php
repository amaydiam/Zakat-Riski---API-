<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @property Admin_model $Admin_model
 */
class Admin_model extends CI_Model
{


    public function login($username,$password)
    {
        $this->db
            ->select("*");
        $this->db->from('admin');
        $this->db->where('username_admin', $username);
        $this->db->where('password_admin', $password);
        $query = $this->db->get();

        return $query->row_array();
    }

}